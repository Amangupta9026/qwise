import '../../utils/file_collection.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

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
            child: createNewPassword(context),
          ),
        )),
      ),
    );
  }

  Column createNewPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create New Password',
          style: TextStyle(
            color: primaryColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1:
              'Your new password much be different from previously used password.',
          size1: 18.0,
          fontWeight1: FontWeight.w400,
        ),
        const SizedBox(height: 20.0),
        const TextWidget(
          text1: 'New Password',
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
        const TextWidget(
          text1: 'Confirm Password',
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
        const SizedBox(height: 50.0),
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
                    context.pushNamed(RouteNames.updatePassword);
                  } else {
                    showMyDialog(
                      context,
                      'Password not match',
                      'New and Confirm Password must be match',
                      () {
                        context.pop();
                      },
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextWidget(
                    text1: 'Reset Password',
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
