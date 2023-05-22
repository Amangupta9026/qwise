import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwise/utils/file_collection.dart';
import 'package:random_avatar/random_avatar.dart';

import '../widget/bottom_navigationbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log("e");
    }

    // ignore: use_build_context_synchronously
    context.pushNamed(RouteNames.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGradient2,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: HeaderWidget(text1: 'Profile', isCenterTitle: true),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        buttonName: 'Logout',
        onButtonPressed: () {
          logout(context);
        },
      ),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('signup')
                    .doc(FirebaseAuth.instance.currentUser?.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  final userData = snapshot.data?.data();

                  return Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: const Border.fromBorderSide(
                                  BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                                image: FirebaseAuth
                                            .instance.currentUser?.photoURL !=
                                        null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          FirebaseAuth.instance.currentUser
                                                  ?.photoURL ??
                                              "",
                                        ),
                                        fit: BoxFit.fill,
                                      )
                                    : null,
                              ),
                              child:
                                  FirebaseAuth.instance.currentUser?.photoURL ==
                                          null
                                      ? RandomAvatar(
                                          FirebaseAuth.instance.currentUser
                                                  ?.email ??
                                              "xyz",
                                        )
                                      : null,
                            ),
                            const SizedBox(height: 10),
                            TextWidget(
                              text1: userData?['firstName'] +
                                  ' ' +
                                  userData?['lastName'],
                              color1: colortext,
                              size1: 18,
                              fontWeight1: FontWeight.w700,
                            ),
                            TextWidget(
                              text1: userData?['email'],
                              color1: colortext,
                              size1: 16,
                              fontWeight1: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.pushNamed(RouteNames.profileEdit);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                        ),
                        child: const TextWidget(
                          text1: 'Edit Profile',
                          color1: Colors.white,
                          size1: 16,
                          fontWeight1: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 60),
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              isReadOnly: true,
                              controller1: TextEditingController(
                                text: userData?['firstName'] +
                                    ' ' +
                                    userData?['lastName'],
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              isReadOnly: true,
                              controller1: TextEditingController(
                                text: userData?['email'] ?? '',
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TextFormFieldWidget(
                              isReadOnly: true,
                              hinttext1: 'Enter your phone number',
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              isReadOnly: true,
                              controller1: TextEditingController(
                                text: userData?['firstName'] ?? '',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
