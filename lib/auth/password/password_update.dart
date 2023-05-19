import '../../utils/file_collection.dart';
import '../../widget/animation_check.dart';

class PasswordUpdateScreen extends StatelessWidget {
  const PasswordUpdateScreen({super.key});

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
            child: passwordUpdate(context),
          ),
        )),
      ),
    );
  }

  Column passwordUpdate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password Updated',
          style: TextStyle(
            color: primaryColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'Your password has been Successfully updated!',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 40.0),
        const AnimatedCheck(),
        const SizedBox(height: 40.0),
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
                  // ref.nextScreen(context);
                  if (ref.userNameController.text ==
                      ref.passwordController.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordUpdateScreen(),
                      ),
                    );
                  } else {
                    showMyDialog(
                      context,
                      'Password not match',
                      'New and Confirm Password must be match',
                      () {
                        Navigator.of(context).pop();
                      },
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextWidget(
                    text1: 'Go to Login',
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
