import '../utils/file_collection.dart';

Future<void> showMyDialog(BuildContext context, String? labelText1,
    String? contentText1, tap1) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextWidget(
          text1: labelText1,
          color1: primaryColor,
          size1: 22.0,
          fontWeight1: FontWeight.w600,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text1: contentText1,
              size1: 16.0,
              fontWeight1: FontWeight.w500,
            ),
            const SizedBox(height: 20.0),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: tap1,
                    child: const Text('Confirm'),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.5,
                    color: Colors.grey,
                  ),
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
