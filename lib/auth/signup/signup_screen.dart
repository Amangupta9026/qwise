import '../../utils/file_collection.dart';
import '../sign_in/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: Container(
        height: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 50.0),
            child: signUp(),
          ),
        )),
      ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
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
        const TextWidget(
          text1: 'Create your QWise account to continue',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'First Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        TextFormFieldWidget(
          controller1: firstNameController,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Last Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        TextFormFieldWidget(
          controller1: lastNameController,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Email Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        TextFormFieldWidget(
          controller1: emailController,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Create Password',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        TextFormFieldWidget(
          controller1: passwordController,
          obsecureText1: _obscureText,
          iconButton1: IconButton(
            icon: Icon(
              color: primaryColor,
              !_obscureText ? Icons.visibility : Icons.visibility_off,
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
              child: TextWidget(
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
              onPressed: () {
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
              },

              // agree ? _doSomething : null,

              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: TextWidget(
                  text1: 'Sign Up',
                  size1: 18.0,
                  color1: Colors.white,
                  fontWeight1: FontWeight.w400,
                ),
              )),
        ),
        const SizedBox(height: 25.0),
        const Center(
          child: TextWidget(
            textAlign1: TextAlign.center,
            text1: 'or Sign Up with',
            size1: 18.0,
            fontWeight1: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconReplaceFun(MdiIcons.google, () {
              showMyDialog(
                context,
                '“QWise” Wants to use “google.com” to sign up',
                'This allows the app and website to share information about you.',
                () {
                  Navigator.of(context).pop();
                },
              );
            }),
            const SizedBox(width: 20.0),
            iconReplaceFun(MdiIcons.facebook, () {
              showMyDialog(
                context,
                '“QWise” Wants to use facebook.com” to sign up',
                'This allows the app and website to share information about you.',
                () {
                  Navigator.of(context).pop();
                },
              );
            }),
            const SizedBox(width: 20.0),
            iconReplaceFun(MdiIcons.twitter, () {
              showMyDialog(
                context,
                '“QWise” Wants to use twitter.com” to sign up',
                'This allows the app and website to share information about you.',
                () {
                  Navigator.of(context).pop();
                },
              );
            }),
            const SizedBox(width: 20.0),
            iconReplaceFun(MdiIcons.linkedin, () {
              showMyDialog(
                context,
                '“QWise” Wants to use linkedin.com” to sign up',
                'This allows the app and website to share information about you.',
                () {
                  Navigator.of(context).pop();
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget iconReplaceFun(IconData? icon1, onPressed1) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
          color: primaryColor,
          iconSize: 35,
          icon: Icon(icon1),
          onPressed: onPressed1),
    );
  }
}
