import 'package:firebase_auth/firebase_auth.dart';
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

  void forgotPassword(BuildContext context) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    context.pushNamed(RouteNames.updatedPasswordSuccess);
  }

  void onNextScreen(BuildContext context) {
    if (emailController.text.isNotEmpty) {
      forgotPassword(context);
    }
  }
}
