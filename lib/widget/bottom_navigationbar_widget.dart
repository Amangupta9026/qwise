import '../utils/file_collection.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final String? buttonName;
  final Function? onButtonPressed;
  final Color? color1;
  const BottomNavigationBarWidget(
      {super.key, this.buttonName, this.onButtonPressed, this.color1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color1 ?? colorGradient2,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: TextButton(
        onPressed: onButtonPressed as void Function()?,
        child: TextWidget(
          color1: colortext,
          text1: buttonName ?? 'Submit',
          size1: 18,
          fontWeight1: FontWeight.w700,
        ),
      ),
    );
  }
}
