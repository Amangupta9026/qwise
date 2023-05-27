import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/file_collection.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _obscureText = true;
  bool agree = false;
  bool get obscureText => _obscureText;

  bool colorChange = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  void toggle() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void toggleAgree() {
    agree = !agree;
    notifyListeners();
  }

  void buttonColorChange() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      colorChange = true;

      notifyListeners();
    } else {
      colorChange = false;
      notifyListeners();
    }
  }

  void createUserWithEmailAndPassword(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    UserCredential? credentails =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    if (credentails.user != null) {
      await credentails.user?.updateDisplayName(
          '${firstNameController.text} ${lastNameController.text}');
      createUser();
      // ignore: use_build_context_synchronously
      context.pushReplacementNamed(RouteNames.main);
    }
    EasyLoading.dismiss();
  }

  void createUser() async {
    await firestore
        .collection('signup')
        .doc(emailController.text)
        .update({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'pic_url': ' ',
          'servertime': FieldValue.serverTimestamp(),
          'isUserLogedIn': true,
        })
        .then((value) => log('User Added'))
        .catchError(
          (error) async {
            await firestore.collection('signup').doc(emailController.text).set({
              'id': FirebaseAuth.instance.currentUser!.uid,
              'firstName': firstNameController.text,
              'lastName': lastNameController.text,
              'email': emailController.text,
              'password': passwordController.text,
              'pic_url': ' ',
              'servertime': FieldValue.serverTimestamp(),
              'isUserLogedIn': true,
            });
          },
        );
  }

  void onNextScreen(BuildContext context) {
    if (agree &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      createUserWithEmailAndPassword(context);
      //  dispose();
    } else if (firstNameController.text.isEmpty &&
        lastNameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill all the fields',
        'All fields are required to fill',
        () {
          context.pop();
        },
      );
    } else if (firstNameController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill first name field',
        'first name are required to fill',
        () {
          context.pop();
        },
      );
    } else if (lastNameController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill last name field',
        'last name are required to fill',
        () {
          context.pop();
        },
      );
    } else if (emailController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill email field',
        'email are required to fill',
        () {
          context.pop();
        },
      );
    } else if (passwordController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill password field',
        'password are required to fill',
        () {
          context.pop();
        },
      );
    } else if (!agree) {
      showMyDialog(
        context,
        'Please accept terms and conditions',
        'checkbox are required to check',
        () {
          context.pop();
        },
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
