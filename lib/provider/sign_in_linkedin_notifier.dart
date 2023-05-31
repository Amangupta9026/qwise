import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:qwise/local/prefs.dart';
import 'package:qwise/utils/file_collection.dart';

import '../local/pref_names.dart';

const String redirectUrl = 'http://youtube.com/callback';
const String clientId = '77ayi7wb8bmtdw';
const String clientSecret = 'xXp8hVosf9VEcqBq';

Dio dio = Dio();
Map<String, dynamic>? result;
final firestore = FirebaseFirestore.instance;

linkedInLogin(BuildContext context) async {
  // EasyLoading.show(status: 'loading...');
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => LinkedInUserWidget(
        redirectUrl: redirectUrl,
        clientId: clientId,
        clientSecret: clientSecret,
        onGetUserProfile: (linkedInUser) async {
          // EasyLoading.dismiss();

          /// This api call retrives profile picture
          Response? response = await dio.get(
              "https://api.linkedin.com/v2/me?projection=(profilePicture(displayImage~:playableStreams))",
              options: Options(
                  responseType: ResponseType.json,
                  sendTimeout: const Duration(seconds: 60000),
                  receiveTimeout: const Duration(seconds: 60000),
                  headers: {
                    HttpHeaders.authorizationHeader:
                        "Bearer ${linkedInUser.user.token.accessToken}"
                  }));
          var profilePic = response.data["profilePicture"]["displayImage~"]
              ["elements"][0]["identifiers"][0]["identifier"];

          Map<String, dynamic> postJson = {
            "user_id": linkedInUser.user.userId,
            "email":
                linkedInUser.user.email?.elements?[0].handleDeep?.emailAddress,
            "pic_url": profilePic,
            "name":
                '${linkedInUser.user.firstName?.localized?.label} ${linkedInUser.user.lastName?.localized?.label}',
            "token": linkedInUser.user.token.accessToken,
            "expires_in": linkedInUser.user.token.expiresIn
          };

          result = postJson;
          linkedInLoginData();

          // EasyLoading.dismiss();

          log(result.toString());
           Prefs.setBool(PrefNames.isLogin, true);
          result != null && result!.isNotEmpty
              // ignore: use_build_context_synchronously
              ? context.pushReplacementNamed(RouteNames.main)
              : null;
        },
      ),
      fullscreenDialog: true,
    ),
  );
}

void linkedInLoginData() async {
  String? token = await FirebaseMessaging.instance.getToken();
  await firestore
      .collection('signup')
      .doc(result?['email'])
      .update({
        'id': result?['user_id'],
        'firstName': result?['name'].toString().split(' ').first,
        'lastName': result?['name'].toString().split(' ').last,
        'email': result?['email'],
        'pic_url': result?['pic_url'],
        'password': ' ',
        'servertime': FieldValue.serverTimestamp(),
        'isUserLogedIn': true,
        'devicetoken': token,
      })
      .then((value) => null)
      .catchError((e) async {
        await firestore.collection('signup').doc(result?['email']).set({
          'id': result?['user_id'],
          'firstName': result?['name'].toString().split(' ').first,
          'lastName': result?['name'].toString().split(' ').last,
          'email': result?['email'],
          'pic_url': result?['pic_url'],
          'password': ' ',
          'servertime': FieldValue.serverTimestamp(),
          'isUserLogedIn': true,
          'devicetoken': token,
        });
      });
}
