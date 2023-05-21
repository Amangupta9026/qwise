import 'package:qwise/utils/file_collection.dart';

class HeaderWidget extends StatelessWidget {
  final IconData? leading1;
  final String? text1;
  final IconData? actions1;
  final bool? isCenterTitle;

  const HeaderWidget(
      {super.key,
      this.leading1,
      this.text1,
      this.actions1,
      this.isCenterTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 35,
      centerTitle: isCenterTitle ?? false,
      elevation: 0,
      backgroundColor: colorGradient2,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          leading1,
          color: colortext,
          size: 30,
        ),
      ),
      title: Text(
        text1!,
        style: const TextStyle(
          color: colortext,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            actions1,
            color: colortext,
          ),
        ),
      ],
    );
  }
}
