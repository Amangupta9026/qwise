import 'package:qwise/provider/forgot_password_notifier.dart';

import '../../utils/file_collection.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
            child: forgotPassword(context),
          ),
        )),
      ),
    );
  }

  Column forgotPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Forgot Password',
          style: TextStyle(
            color: primaryColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1:
              'Enter registered email below to receive password reset instruction',
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
        Consumer<ForgotPasswordNotifier>(builder: (context, ref, child) {
          return TextFormFieldWidget(
            controller1: ref.emailController,
            onChanged1: (value) {
              ref.buttonColorChange();
            },
          );
        }),
        const SizedBox(height: 30.0),
        Consumer<ForgotPasswordNotifier>(builder: (context, ref, child) {
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
                      ref.colorChange ? primaryColor : Colors.grey,
                      // ref.emailController.text.isNotEmpty
                      //     ? primaryColor
                      //     : Colors.grey
                    )),
                onPressed: () {
                  ref.onNextScreen(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextWidget(
                    text1: 'Send',
                    size1: 18.0,
                    color1: Colors.white,
                    fontWeight1: FontWeight.w400,
                  ),
                )),
          );
        }),
      ],
    );
  }
}
