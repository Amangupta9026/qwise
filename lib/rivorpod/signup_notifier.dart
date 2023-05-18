import '../utils/file_collection.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _obscureText = false;
  bool agree = false;
  bool get obscureText => _obscureText;
  void toggle() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
  void toggleAgree() {
    agree = !agree;
    notifyListeners();
  }
}
