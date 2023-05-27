import 'dart:convert';
import 'dart:developer';

import 'package:qwise/utils/file_collection.dart';
import 'package:http/http.dart' as http;

class SendNotificationfromAdminNotifier extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> sendNotification({
    // String? deviceToken,
    String? title,
    String? message,
    String? cTn,
    String? uid,
  }) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';

    // String toParams = "/topics/$uid";

    final data = {
      "notification": {
        "body": title,
        "title": message,
        'android_channel_id': 'QWise',
        "default_sound": true
      },
      'android': {
        'notification': {'channel_id': 'QWise', "default_sound": false},
      },
      "priority": "high",
      "data": {
        //   "name": senderName,
        "channel_id": 'QWise',
        //   "channel_token": cTn,
        //  "user_id": uid,
        //  "to_user_id": ),
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",

        "default_sound": false
      },
      "to":
          'dc1rAaOaRaatDGnXWRzSHh:APA91bHnh7z2AGMv3m8UPF04oEdRq0yuBzMyM60hRNNK2feajxc1dgOwJc6uMUSgRsm6LKAf6tG-Kdh9bVxMTHrucV5vWnxe58TmpurR57XVYMtU-mu-SskIkzN0cvVEjVgfsHsOa9RM',
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAAcVOv9j0:APA91bEl4iCBWkDhR5W-2Vm8mN4gQLni81Mwr2s1BwjWDhUMayD9MiJvJxmEzKAuBoGrCJ3QOBh_Cm3CNb8SQM56Ujyd9L6_Sx7FlW0-xt8z7iXOCyXxC0oNy4lGIApdogmWziTCZTPK '
    };
    var url = Uri.parse(postUrl);

    final response = await http.post(url,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      log("sent notification with data: ${response.body}");
      log("true");
    } else {
      log("failed notification with data: ${response.body}");

      log("false");
    }
  }
}
