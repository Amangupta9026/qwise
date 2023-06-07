import 'package:qwise/provider/google_sign_in.dart';

import '../../provider/sign_in_linkedin_notifier.dart';
import '../../utils/file_collection.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: AppUtils.decoration1(),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                context.pushNamed(RouteNames.signUpScreen);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 50.0),
            child: signIn(context),
          ),
        )),
      ),
    );
  }

  Column signIn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sign in',
              style: TextStyle(
                color: primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
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
          text1: 'Email',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        Consumer<SigninNotifer>(builder: (context, ref, child) {
          return TextFormFieldWidget(
            onChanged1: (value) {
              ref.buttonColorChange();
            },
            controller1: ref.userNameController,
          );
        }),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Password',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        Consumer<SigninNotifer>(builder: (context, ref, child) {
          return TextFormFieldWidget(
            onChanged1: (value) {
              ref.buttonColorChange();
            },
            controller1: ref.passwordController,
            obsecureText1: ref.obscureText,
            iconButton1: IconButton(
              icon: Icon(
                color: primaryColor,
                !ref.obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: ref.toggle,
            ),
          );
        }),
        const SizedBox(height: 20.0),
        InkWell(
          onTap: () {
            context.pushNamed(RouteNames.forgotPasswordScreen);
          },
          child: const Align(
            alignment: Alignment.centerRight,
            child: TextWidget(
              textAlign1: TextAlign.end,
              text1: 'Forgot Password?',
              size1: 18.0,
              fontWeight1: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Consumer<SigninNotifer>(builder: (context, ref, child) {
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                    foregroundColor: MaterialStateProperty.all(primaryColor),
                    backgroundColor: MaterialStateProperty.all(
                        ref.colorChange ? primaryColor : Colors.grey)),
                onPressed: () {
                  if (ref.colorChange) {
                    ref.nextScreen(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextWidget(
                    text1: 'Sign in',
                    size1: 18.0,
                    color1: Colors.white,
                    fontWeight1: FontWeight.w400,
                  ),
                )),
          );
        }),
        const SizedBox(height: 25.0),
        const Center(
          child: TextWidget(
            textAlign1: TextAlign.center,
            text1: 'Sign Up / Sign In with',
            size1: 18.0,
            fontWeight1: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20.0),
        Consumer<SigninNotifer>(builder: (context, ref, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ref.iconReplaceFun(MdiIcons.google, () {
                showMyDialog(
                    context,
                    '“QWise Learning” Wants to use “google.com” to sign in',
                    'This allows the app and website to share information about you.',
                    () {
                      onTapGoogle(context);
                    },
                    istwobutton: true,
                    actiontap1: () {
                      context.pop();
                    });
              }),
              const SizedBox(width: 20.0),
              ref.iconReplaceFun(MdiIcons.linkedin, () {
                showMyDialog(
                    context,
                    '“QWise Learning” Wants to use linkedin.com” to sign in',
                    'This allows the app and website to share information about you.',
                    () {
                      linkedInLogin(context);
                    },
                    istwobutton: true,
                    actiontap1: () {
                      context.pop();
                    });
              }),
            ],
          );
        }),
      ],
    );
  }
}
