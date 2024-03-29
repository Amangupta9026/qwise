import 'package:flutter/cupertino.dart';

import '../utils/file_collection.dart';

Future<void> showMyDialog(
    BuildContext context, String? labelText1, String? contentText1, actiontap2,
    {actiontap1,
    String? actionButtonText1,
    String? actionButtonText2,
    bool? istwobutton = true}) async {
  return showCupertinoDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: TextWidget(
          text1: labelText1,
          color1: primaryColor,
          size1: 20.0,
          fontWeight1: FontWeight.w600,
        ),
        actions: [
          if (istwobutton == true) ...{
            CupertinoDialogAction(
              onPressed: actiontap1,
              child: Text(
                actionButtonText1 ?? 'Cancel',
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CupertinoDialogAction(
                onPressed: actiontap2,
                child: Text(
                  actionButtonText2 ?? 'Confirm',
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          } else ...{
            CupertinoDialogAction(
                onPressed: actiontap2, child: const Text('Okay')),
          }
        ],
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            TextWidget(
              text1: contentText1,
              size1: 16.0,
              fontWeight1: FontWeight.w500,
            ),
          ],
        ),
      );
    },
  );
}
