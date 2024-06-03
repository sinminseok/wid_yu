import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/YoungMainGoalResponse.dart';

import '../../../../final-dto/young-dto/response/user/OldResponseByYoung.dart';
import '../dto/HealthResponse.dart';

class HeartBitDetailApi with ChangeNotifier {
  final String YOUNG_GOAL_API = ROOT_API;


  //HEARTBIT
  Future<HealthResponse?> loadHeartBitData(int seniorIdx, String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");


    var response = await http.get(
      Uri.parse(ROOT_API + "health/info/of-senior/" + seniorIdx.toString() + "/" + type),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    print(utf8.decode(response.bodyBytes));
    print("------");


    if (response.statusCode == 200) {
      return HealthResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }
}
