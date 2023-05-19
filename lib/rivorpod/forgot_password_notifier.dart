import 'package:qwise/auth/password/verify_otp_screen.dart';
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

  void onNextScreen(BuildContext context) {
    if (emailController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyOtpScreen(),
        ),
      );
    }
  }
}
