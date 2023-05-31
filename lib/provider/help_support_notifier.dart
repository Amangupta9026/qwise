// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qwise/utils/file_collection.dart';

class HelpSupportNotifier extends ChangeNotifier {
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void onSubmit(BuildContext context) async {
    if (subjectController.text.isEmpty && messageController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill all the fields',
        'All fields are required to fill',
        () {
          context.pop();
        },
        istwobutton: false,
      );
    } else {
      await createUser(context);
      subjectController.clear();
      messageController.clear();
    }
  }

  Future<void> createUser(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    final userData = await FirebaseFirestore.instance
        .collection('signup')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .get();

    await FirebaseFirestore.instance
        .collection('help & Support') 
        // .doc(userData.data()?['email'] ?? '')
        .add({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'subject': subjectController.text,
          'message': messageController.text,
          'email': userData.data()?['email'] ?? '',
          'servertime': FieldValue.serverTimestamp(),
        })
        .then((value) => log('Support & Help'))
        .catchError(
          (error) async {
            await FirebaseFirestore.instance
                .collection('help & Support')
                // .doc(userData.data()?['email'] ?? '')
                .add({
              'id': FirebaseAuth.instance.currentUser!.uid,
              'subject': subjectController.text,
              'message': messageController.text,
              'email': userData.data()?['email'] ?? '',
              'servertime': FieldValue.serverTimestamp(),
            });
          },
        );
    showMyDialog(
      context,
      'Successfully',
      'Message successfully sent',
      () {
        context.pop();
      },
      istwobutton: false,
    );
    EasyLoading.dismiss();
  }
}
