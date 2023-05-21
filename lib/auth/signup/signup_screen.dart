import 'dart:developer';

import '../../provider/google_sign_in.dart';
import '../../utils/file_collection.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('SignUpScreen');
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 90.0),
            child: signUp(context),
          ),
        )),
      ),
    );
  }

  Column signUp(BuildContext context) {
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
                context.pushNamed(RouteNames.signInScreen);
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
        Consumer<SignUpNotifier>(builder: (context, ref, child) {
          return TextFormFieldWidget(
            controller1: ref.firstNameController,
            onChanged1: (value) {
              ref.buttonColorChange();
            },
          );
        }),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Last Name',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        Consumer<SignUpNotifier>(builder: (context, ref, child) {
          return TextFormFieldWidget(
            controller1: ref.lastNameController,
            onChanged1: (value) {
              ref.buttonColorChange();
            },
          );
        }),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Email',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        Consumer<SignUpNotifier>(builder: (context, ref, child) {
          return TextFormFieldWidget(
            controller1: ref.emailController,
            onChanged1: (value) {
              ref.buttonColorChange();
            },
          );
        }),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Create Password',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 10.0),
        Consumer<SignUpNotifier>(builder: (_, ref, child) {
          return TextFormFieldWidget(
            onChanged1: (value) {
              ref.buttonColorChange();
            },
            controller1: ref.passwordController,
            obsecureText1: ref.obscureText,
            iconButton1: IconButton(
              icon: Icon(
                color: primaryColor,
                ref.obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                ref.toggle();
              },
            ),
          );
        }),
        const SizedBox(height: 30.0),
        Consumer<SignUpNotifier>(
          builder: (context, ref, child) {
            return ListTile(
              leading: Checkbox(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.all(primaryColor),
                value: ref.agree,
                onChanged: (value) {
                  ref.toggleAgree();
                },
              ),
              dense: true,
              isThreeLine: false,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 4,
              onTap: () {
                ref.toggleAgree();
              },
              title: const TextWidget(
                text1: 'I have read and accept terms and conditions',
                size1: 12,
              ),
            );
          },
        ),
        const SizedBox(height: 30.0),
        Consumer<SignUpNotifier>(builder: (context, ref, child) {
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
                        // ref.agree
                        ref.colorChange && ref.agree
                            ? primaryColor
                            : Colors.grey)),
                onPressed: () {
                  if (ref.colorChange && ref.agree) {
                    ref.onNextScreen(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextWidget(
                    text1: 'Sign Up',
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
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconReplaceFun(MdiIcons.google, () {
              showMyDialog(
                  context,
                  '“QWise Learning” Wants to use “google.com” to sign up',
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
            iconReplaceFun(MdiIcons.facebook, () {
              showMyDialog(
                  context,
                  '“QWise Learning” Wants to use facebook.com” to sign up',
                  'This allows the app and website to share information about you.',
                  () {
                    Navigator.of(context).pop();
                  },
                  istwobutton: true,
                  actiontap1: () {
                    context.pop();
                  });
            }),
            const SizedBox(width: 20.0),
            iconReplaceFun(MdiIcons.twitter, () {
              showMyDialog(
                  context,
                  '“QWise Learning” Wants to use twitter.com” to sign up',
                  'This allows the app and website to share information about you.',
                  () {
                    Navigator.of(context).pop();
                  },
                  istwobutton: true,
                  actiontap1: () {
                    context.pop();
                  });
            }),
            const SizedBox(width: 20.0),
            iconReplaceFun(MdiIcons.linkedin, () {
              showMyDialog(
                  context,
                  '“QWise Learning” Wants to use linkedin.com” to sign up',
                  'This allows the app and website to share information about you.',
                  () {
                    Navigator.of(context).pop();
                  },
                  istwobutton: true,
                  actiontap1: () {
                    context.pop();
                  });
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
