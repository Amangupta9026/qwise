import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qwise/local/pref_names.dart';
import 'package:qwise/local/prefs.dart';
import 'package:qwise/utils/file_collection.dart';

class SigninNotifer extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool colorChange = false;
  final firestore = FirebaseFirestore.instance;

  void toggle() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  Widget iconReplaceFun(IconData? icon1, onPressed1) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
          color: primaryColor,
          iconSize: 35,
          icon: Icon(icon1),
          onPressed: onPressed1),
    );
  }

  void buttonColorChange() {
    if (userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      colorChange = true;
      notifyListeners();
    } else {
      colorChange = false;
      notifyListeners();
    }
  }

  void login(BuildContext context) async {
    try {
      EasyLoading.show(status: 'loading...');
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userNameController.text,
              password: passwordController.text);
      if (credential.user != null) {
        // ignore: use_build_context_synchronously
        context.pushReplacementNamed(RouteNames.main);
        Prefs.setBool(PrefNames.isLogin, true);
      }
    } catch (e) {
      showMyDialog(
          context, 'Invalid Credentials', 'Please enter valid credentials', () {
        Navigator.of(context).pop();
      }, istwobutton: false);
    }
    EasyLoading.dismiss();
  }

  // next Screen on Button Click
  void nextScreen(BuildContext context) {
    if (userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      login(context);
    } else if (userNameController.text.isEmpty &&
        passwordController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill all the fields',
        'All fields are required to fill',
        () {
          Navigator.of(context).pop();
        },
      );
    } else if (userNameController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill user name field',
        'user name are required to fill',
        () {
          Navigator.of(context).pop();
        },
      );
    } else if (passwordController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill password field',
        'password are required to fill',
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  void signInLoginData() {
    firestore.collection('signup').doc(userNameController.text).update({
      'servertime': FieldValue.serverTimestamp(),
      'isUserLogedIn': true,
    });
  }
}
