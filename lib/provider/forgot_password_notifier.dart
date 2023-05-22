import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qwise/utils/file_collection.dart';

class ForgotPasswordNotifier extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  bool colorChange = false;

  void buttonColorChange() {
    if (emailController.text.isNotEmpty) {
      colorChange = true;
      notifyListeners();
    } else {
      colorChange = false;
      notifyListeners();
    }
  }

  void forgotPassword(BuildContext context) async {
    bool isEmailCorrect = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    if (!isEmailCorrect) {
      showMyDialog(
          context, 'Invalid Credentials', 'Please enter valid credentials', () {
        Navigator.of(context).pop();
      }, istwobutton: false);
      return;
    }

    bool isThereAnyError = false;

    try {
      EasyLoading.show(status: 'loading...');
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
    } catch (e) {
      isThereAnyError = true;
      showMyDialog(
          context, 'Invalid Credentials', 'Please enter valid credentials', () {
        Navigator.of(context).pop();
      }, istwobutton: false);
    } finally {
      EasyLoading.dismiss();
      if (!isThereAnyError) {
        context.pushNamed(RouteNames.updatedPasswordSuccess);
      }
    }
  }

  void onNextScreen(BuildContext context) {
    if (emailController.text.isNotEmpty) {
      forgotPassword(context);
    }
  }
}
