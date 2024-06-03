import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/young/goal/goal-create/dto/UserSelectResponse.dart';
import 'package:wid_yu/young/goal/goal-edit/dto/GoalEditRequest.dart';

import '../../../../common/api/CommonApiUrl.dart';
import '../../../../final-dto/common-dto/request/goal/GoalGeneratorRequest.dart';

class GoalEditApi with ChangeNotifier {
  final String GOAL_EDIT_URL = ROOT_API + "goals/edit";
  final String GOAL_DELETE_URL = ROOT_API + "goals/delete/";

  Future<bool> editGoalApi(GoalEditRequest dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");
    print(json.encode(dto.toJson()));

    var response = await http.patch(Uri.parse(GOAL_EDIT_URL),
        headers: {
          'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
          'Content-Type': 'application/json',
        },
        body: json.encode(dto.toJson()));

    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteGoalApi(int goalIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.delete(
      Uri.parse(GOAL_DELETE_URL+"${goalIdx}"),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
