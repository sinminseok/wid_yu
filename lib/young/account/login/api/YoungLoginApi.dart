import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';

class YoungLoginApi extends ChangeNotifier {
  final YOUNG_LOGIN_URL = ROOT_API + "guardian/login";

  Future<bool> loginYoung(
      bool isAuthLogin, String id, String pw, String fcmToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(YOUNG_LOGIN_URL),
        headers: {
          'Content-Type': 'application/json',

          'Accept': 'application/json',
        },
        body: json.encode({'id': id, 'password': pw, 'fcmToken': fcmToken}));


    print(jsonDecode(utf8.decode(response.bodyBytes)));
    print(response.statusCode);

    //쿠키 저장
    if (response.statusCode == 200) {
      if (isAuthLogin) {}
      var extractJSessionId2 = await extractJSessionId(response);
      print(extractJSessionId2);
      prefs.setString("session", extractJSessionId2!);
      return true;
    }
    return false;
  }

  Future<String?> extractJSessionId(http.Response response) async {
    Map<String, String> headers = response.headers;
    String? setCookieHeader = headers['set-cookie'];
    print(setCookieHeader);
    if (setCookieHeader != null) {
      List<String> cookies = setCookieHeader.split(','); // 쉼표로 구분된 쿠키들을 분리
      for (String cookie in cookies) {
        if (cookie.contains('JSESSIONID')) {
          // JSESSIONID를 포함하는 쿠키 찾음
          List<String> parts = cookie.split(';');
          for (String part in parts) {
            if (part.trim().startsWith('JSESSIONID')) {
              // JSESSIONID=xxxx 형식의 부분 찾음
              List<String> keyValue = part.trim().split('=');
              if (keyValue.length == 2) {
                // JSESSIONID 값 반환
                return keyValue[1];
              }
            }
          }
        }
      }
    }

    return null; // JSESSIONID를 찾지 못한 경우
  }
}
