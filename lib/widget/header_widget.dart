import 'package:qwise/utils/file_collection.dart';

class HeaderWidget extends StatelessWidget {
  final IconData? leading1;
  final String? text1;
  final IconData? actions1;

  const HeaderWidget({super.key, this.leading1, this.text1, this.actions1});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 35,
      centerTitle: false,
      elevation: 0,
      backgroundColor: colorGradient2,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          leading1,
          color: colortext,
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
