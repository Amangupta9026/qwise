import 'package:qwise/auth/password/create_new_password.dart';
import 'package:qwise/utils/file_collection.dart';

class VerifyOTPNotifier extends ChangeNotifier {
  final TextEditingController otpController = TextEditingController();
  bool colorChange = false;

  void buttonColorChange() {
    if (otpController.text.isNotEmpty && otpController.text.length == 6) {
      colorChange = true;
      notifyListeners();
    } else {
      colorChange = false;
      notifyListeners();
    }
  }

  void onNextScreen(BuildContext context) {
    if (otpController.text.isNotEmpty && otpController.text.length == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateNewPassword(),
        ),
      );
    }
  }

  // dispose
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}
