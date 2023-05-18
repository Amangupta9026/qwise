import '../../utils/file_collection.dart';
import '../../widget/textformfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;

  // Initially password is obscure
  bool _obscureText = true;

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 50.0),
          child: signUp(),
        ),
      )),
    );
  }

  Column signUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                color: primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        const TextStyleWidget(
          text1: 'Create your Wiseup account to continue',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 20.0),
        const TextStyleWidget(
          text1: 'First Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        const TextFormFieldWidget(),
        const SizedBox(height: 20.0),
        const TextStyleWidget(
          text1: 'Last Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        const TextFormFieldWidget(),
        const SizedBox(height: 20.0),
        const TextStyleWidget(
          text1: 'Email Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        const TextFormFieldWidget(),
        const SizedBox(height: 20.0),
        const TextStyleWidget(
          text1: 'Create Password',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        TextFormFieldWidget(
          obsecureText1: _obscureText,
          iconButton1: IconButton(
            icon: Icon(
              color: primaryColor,
              !_obscureText ? Icons.visibility : Icons.visibility_off,
              // password ? Icons.visibility : Icons.visibility_off,
              // color: primaryColor
            ),
            onPressed: toggle,
          ),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(primaryColor),
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value ?? false;
                });
              },
            ),
            const Flexible(
              child: TextStyleWidget(
                text1: 'I have read and accept terms and conditions',
                size1: 18.0,
                fontWeight1: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  foregroundColor: MaterialStateProperty.all(primaryColor),
                  backgroundColor: MaterialStateProperty.all(
                      agree ? primaryColor : Colors.grey)),
              onPressed: () {},

              // agree ? _doSomething : null,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: TextStyleWidget(
                  text1: 'Sign Up',
                  size1: 18.0,
                  color1: Colors.white,
                  fontWeight1: FontWeight.w400,
                ),
              )),
        ),
      ],
    );
  }
}
