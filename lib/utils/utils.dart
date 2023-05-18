import 'dart:developer';
import 'file_collection.dart';

class AppUtils {
  static Future<void> handleNotificationPermission(Permission permission) async {
    final status = await permission.request();
    log(status.toString(), name: 'AppUtils');
  }
}
