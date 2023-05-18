import 'package:qwise/utils/file_collection.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hinttext1;
  final Widget? iconButton1;
  final bool? obsecureText1;
  const TextFormFieldWidget(
      {super.key, this.hinttext1, this.iconButton1, this.obsecureText1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(
          fontSize: 18,
        ),
        obscureText: obsecureText1 ?? false,
        decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hinttext1 ?? '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
          ),
          suffixIcon: iconButton1 ?? const SizedBox(),
        ));
  }
}
