import 'package:flutter/cupertino.dart';

import '../utils/file_collection.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final String? buttonName;
  final Function? onButtonPressed;
  const BottomNavigationBarWidget({super.key, this.buttonName, this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 60,
          decoration: const BoxDecoration(
            color: colorGradient2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: TextButton(
            onPressed: onButtonPressed as void Function()?,
            child:  TextWidget(
              color1: colortext,
              text1: buttonName ?? 'Submit',
              size1: 18,
              fontWeight1: FontWeight.w700,
            ),
          ),
        );
  }
}