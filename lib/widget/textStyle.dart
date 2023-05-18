import '../utils/file_collection.dart';

class TextStyleWidget extends StatelessWidget {
  final String? text1;
  final double? size1;
  final Color? color1;
  final FontWeight? fontWeight1;
  final TextAlign? textAlign1;
  const TextStyleWidget(
      {super.key,
      this.text1,
      this.size1,
      this.color1,
      this.fontWeight1,
      this.textAlign1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text1.toString(),
      textAlign: textAlign1 ?? TextAlign.start,
      style: TextStyle(
          color: color1 ?? Colors.black,
          fontSize: size1,
          fontWeight: fontWeight1),
    );
  }
}
