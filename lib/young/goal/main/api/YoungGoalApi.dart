import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/urls/CommonApiUrl.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/YoungMainGoalResponse.dart';

import '../../../../final-dto/young-dto/response/user/OldResponseByYoung.dart';

class YoungGoalApi with ChangeNotifier {
  final String YOUNG_GOAL_API = ROOT_API;

  //보호자 메인페이지
  Future<YoungMainGoalResponse?> loadMainPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");


    var response = await http.get(
      Uri.parse(YOUNG_GOAL_API + "goals/guardian/main"),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      //todo 변경

      int userIdx =  json.decode(utf8.decode(response.bodyBytes))["data"]
      ["guardianGoalList"]["userIdx"];

      prefs.setInt("user_idx", userIdx);
      List<OldResponseByYoung>? seniorsGoalList = [];
      if (json.decode(utf8.decode(response.bodyBytes))["data"]
              ["seniorsGoalList"] !=
          null) {
        seniorsGoalList = List<OldResponseByYoung>.from(json
            .decode(utf8.decode(response.bodyBytes))["data"]["seniorsGoalList"]
            .map((x) => OldResponseByYoung.fromJson(x)));
      }


      YoungMainGoalResponse youngMainGoalResponse =
          YoungMainGoalResponse.fromJson(
              json.decode(utf8.decode(response.bodyBytes))["data"]
                  ["guardianGoalList"]);

      youngMainGoalResponse.setSeniorsGoalList(seniorsGoalList);

      return youngMainGoalResponse;
    }
    return null;
  }
}
