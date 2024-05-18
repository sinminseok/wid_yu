import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';

class FamilyManagerApi with ChangeNotifier {
  final String ADD_YOUNG_API = ROOT_API + "senior/add/";

  Future<bool> addYoungAccount(int userIdx) async {
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

    print(json.decode(utf8.decode(response.bodyBytes)));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
