import 'dart:async';
import 'dart:developer';

import 'package:bard_api/bard_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widget/header_widget.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  AiChatScreenState createState() => AiChatScreenState();
}

class AiChatScreenState extends State<AiChatScreen>
    with WidgetsBindingObserver {
  late ScrollController _scrollController;
  final TextEditingController _chatController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final chatRoomCollection = FirebaseFirestore.instance.collection('bard');
  final sessionCollection = FirebaseFirestore.instance.collection('session');
  String sessionId = "";

  bool isProgressRunning = false;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController = ScrollController();
    chatRoomCollection.doc(FirebaseAuth.instance.currentUser?.email).set({
      "name": _auth.currentUser?.displayName?.split(" ")[0] ?? "",
      "email_id": _auth.currentUser?.email ?? "",
      "photo_url": _auth.currentUser?.photoURL ?? "",
    });
    sessionCollection
        .doc("1")
        .get()
        .then((value) => sessionId = value["session"]);
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _chatController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    final bottomOffset = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      bottomOffset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  Future<void> onSendMessage() async {
    if (mounted) {
      setState(() {
        isProgressRunning = true;
      });
    }
    final bard = ChatBot(sessionId: sessionId);
    final result = await bard.ask(_chatController.text);
    Map<String, dynamic> messages = {
      "name": _auth.currentUser?.displayName?.split(" ")[0] ?? "",
      "email_id": _auth.currentUser?.email ?? "",
      "photo_url": _auth.currentUser?.photoURL ?? "",
      "message": _chatController.text,
      "time": FieldValue.serverTimestamp(),
    };
    _chatController.clear();
    chatRoomCollection
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection('chats')
        .add(messages);
    Map<String, dynamic> messages2 = {
      "name": "AI Learning",
      "email_id": "aibot@gmail.com",
      "photo_url":
          "https://png.pngtree.com/element_our/20200609/ourmid/pngtree-learning-machine-robot-image_2234559.jpg",
      "message": result["content"],
      "time": FieldValue.serverTimestamp(),
    };
    chatRoomCollection
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection('chats')
        .add(messages2);
    log("$result");

    if (mounted) {
      setState(() {
        isProgressRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: HeaderWidget(text1: 'AI Learning', isCenterTitle: true),
      ),
      body: Container(
        height: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: chatRoomCollection
                              .doc(FirebaseAuth.instance.currentUser?.email)
                              .collection('chats')
                              .orderBy('time', descending: true)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data?.docs.isEmpty ?? true) {
                                return Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/ai_learning.webp",
                                        height: 200,
                                        width: 200,
                                      ),
                                      const Text("Learn with me..."),
                                    ],
                                  ),
                                );
                              }
                              return Expanded(
                                child: ListView.builder(
                                    controller: _scrollController,
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.docs.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final chatData =
                                          snapshot.data?.docs[index];
                                      return Container(
                                        constraints: BoxConstraints(
                                            maxWidth: size.width * 0.7),
                                        alignment: chatData?['email_id'] ==
                                                _auth.currentUser?.email
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 10,
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment: chatData?[
                                                            'email_id'] ==
                                                        _auth.currentUser?.email
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: chatData?[
                                                                        'email_id'] ==
                                                                    _auth
                                                                        .currentUser
                                                                        ?.email
                                                                ? NetworkImage(
                                                                    chatData?[
                                                                            'photo_url'] ??
                                                                        "",
                                                                  )
                                                                : Image.asset(
                                                                    "assets/images/ai_learning.webp",
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ).image,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          border: Border.all(
                                                            color: primaryColor,
                                                            width: 1,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        chatData?['name'] ?? "",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    chatData?['message'],
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                    ),
                                                    textAlign:
                                                        chatData?['email_id'] ==
                                                                _auth
                                                                    .currentUser
                                                                    ?.email
                                                            ? TextAlign.right
                                                            : TextAlign.left,
                                                  ),
                                                  Text(
                                                    timeago.format(
                                                      chatData?['time'] == null
                                                          ? DateTime.now()
                                                          : chatData?['time']
                                                              .toDate(),
                                                    ),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  width: size.width,
                  alignment: Alignment.center,
                  child: TextFormField(
                    autofocus: false,
                    controller: _chatController,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            if (_chatController.text.trim().isNotEmpty) {
                              onSendMessage();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.send),
                          )),
                      hintText: 'Type here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              // }
            ],
          ),
        ),
      ),
    );
  }
}