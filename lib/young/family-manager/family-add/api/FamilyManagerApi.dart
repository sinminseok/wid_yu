import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';

class FamilyManagerApi with ChangeNotifier {
  final String ADD_YOUNG_API = ROOT_API + "guardian/add/other-guardians/";

  Future<bool> addYoungAccount(int userIdx) async {
    print(userIdx);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.get(
      Uri.parse(ADD_YOUNG_API + "${userIdx}"),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("DAS");
    print(json.decode(utf8.decode(response.bodyBytes)));
    print(response.statusCode);

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
