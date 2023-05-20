import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qwise/provider/verify_otp_screen_notifier.dart';

import '../../utils/file_collection.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
            child: verifyOTP(context),
          ),
        )),
      ),
    );
  }

  Column verifyOTP(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Verify OTP',
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

      // OTP
      Consumer<VerifyOTPNotifier>(builder: (context, ref, child) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7),
            child: PinCodeTextField(
              appContext: context,
              enablePinAutofill: true,
              autoFocus: true,
              backgroundColor: Colors.transparent,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,

              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 6) {
                  return "Please enter OTP";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.grey),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              // errorAnimationController: errorController,
              controller: ref.otpController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                debugPrint("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                ref.buttonColorChange();
              },
            ));
      }),

      const SizedBox(height: 30.0),

      Consumer<VerifyOTPNotifier>(builder: (context, ref, child) {
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
    ]);
  }
}
