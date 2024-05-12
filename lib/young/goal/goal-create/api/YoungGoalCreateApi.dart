import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/young/goal/goal-create/dto/UserSelectResponse.dart';

import '../../../../common/api/CommonApiUrl.dart';
import '../../../../final-dto/common-dto/request/goal/GoalGeneratorRequest.dart';

class YoungGoalCreateApi with ChangeNotifier {
  final String GOAL_CREATE_URL = ROOT_API + "goals/insert";
  final String LOAD_USER_INFO = ROOT_API + "guardian/info/seniors";

  Future<bool> createGoalApi(GoalGeneratorRequest dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");
    print(json.encode(dto.toJson()));

    var response = await http.post(Uri.parse(GOAL_CREATE_URL),
        headers: {
          'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
          'Content-Type': 'application/json',
        },
        body: json.encode(dto.toJson()));


    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<UserSelectResponse>?> loadAllUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var res = await http.get(
      Uri.parse(LOAD_USER_INFO),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );


    if (res.statusCode == 200) {
      List<UserSelectResponse> users = [];
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
    }

    return null;
  }
}
