import '../utils/file_collection.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _obscureText = false;
  bool agree = false;
  bool get obscureText => _obscureText;

  bool colorChange = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  void onNextScreen(BuildContext context) {
      if (agree &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    } else if (firstNameController.text.isEmpty &&
        lastNameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill all the fields',
        'All fields are required to fill',
        () {
          Navigator.of(context).pop();
        },
      );
    } else if (firstNameController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill first name field',
        'first name are required to fill',
        () {
          Navigator.of(context).pop();
        },
      );
    } else if (lastNameController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill last name field',
        'last name are required to fill',
        () {
          Navigator.of(context).pop();
        },
      );
    } else if (emailController.text.isEmpty) {
      showMyDialog(
        context,
        'Please fill email field',
        'email are required to fill',
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
    } else if (!agree) {
      showMyDialog(
        context,
        'Please accept terms and conditions',
        'checkbox are required to check',
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }
}
