import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qwise/local/pref_names.dart';
import 'package:qwise/local/prefs.dart';

import '../utils/file_collection.dart';

void onTapGoogle(context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  if (auth.currentUser != null) {
     Prefs.setValue(PrefNames.isLogin, 'true');
    GoRouter.of(context).pushReplacementNamed(RouteNames.main);
  } else {

    EasyLoading.show(status: 'loading...');
       Prefs.setValue(PrefNames.isLogin, 'true');
    await googleSignIn.signIn();
    final GoogleSignInAccount? googleUser = googleSignIn.currentUser;
    if (googleUser != null) {
       
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        createUser(
            userCredential.user?.displayName!.split(' ')[0] ?? '',
            userCredential.user?.displayName!.split(' ')[1] ?? '',
            userCredential.user?.email! ?? '',
            userCredential.user?.photoURL ?? '');
        GoRouter.of(context).pushReplacementNamed(RouteNames.main);
      }
    }
    EasyLoading.dismiss();
  }
}

void createUser(
    String firstName, String lastName, String email, String profilePic) async {
  final firestore = FirebaseFirestore.instance;
   String? token = await FirebaseMessaging.instance.getToken();
  await firestore
      .collection('signup')
      .doc(email)
      .update({
        'id': FirebaseAuth.instance.currentUser!.uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': ' ',
        'pic_url': profilePic,
        'servertime': FieldValue.serverTimestamp(),
        'isUserLogedIn': true,
       'devicetoken': token,
      })
      .then((value) {})
      .catchError((error) async {
        await firestore.collection('signup').doc(email).set({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': ' ',
          'pic_url': profilePic,
          'servertime': FieldValue.serverTimestamp(),
          'isUserLogedIn': true,
          'devicetoken': token,
        });
      });
}
