import '../../utils/file_collection.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController userNameController = TextEditingController();
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
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 50.0),
            child: signIn(),
          ),
        )),
      ),
    );
  }

  Column signIn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sign in',
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
          text1: 'Welcome back to QWise!',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'User Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        TextFormFieldWidget(
          controller1: userNameController,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Password',
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
        const SizedBox(height: 20.0),
        const Align(
          alignment: Alignment.centerRight,
          child: TextWidget(
            textAlign1: TextAlign.end,
            text1: 'Forgot Password?',
            size1: 18.0,
            fontWeight1: FontWeight.w400,
          ),
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
                      userNameController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                          ? primaryColor
                          : Colors.grey)),
              onPressed: () {
                if (userNameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
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
              },

              // agree ? _doSomething : null,

              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: TextWidget(
                  text1: 'Sign in',
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
            text1: 'or Sign in with',
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
                '“Wiseup” Wants to use “google.com” to sign in',
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
                '“Wiseup” Wants to use facebook.com” to sign in',
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
                '“Wiseup” Wants to use twitter.com” to sign in',
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
                '“Wiseup” Wants to use linkedin.com” to sign in',
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
