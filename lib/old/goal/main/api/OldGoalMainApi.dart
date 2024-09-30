
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../common/urls/CommonApiUrl.dart';
import '../../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';

class OldGoalMainApi extends ChangeNotifier {
  final String OLD_MAIN_PAGE_API = ROOT_API + "goals/senior/main";

  //보호자 메인페이지
  Future<OldMainGoalResponse?>? loadMainPage() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session =await prefs.getString("session");


    var response = await http.get(
      Uri.parse(OLD_MAIN_PAGE_API),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if(response.statusCode == 200){
      OldMainGoalResponse oldMainGoalResponse = OldMainGoalResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
      prefs.setInt("point", json.decode(utf8.decode(response.bodyBytes))["data"]["point"]);
      prefs.setInt("user_idx", oldMainGoalResponse.userIdx!);
      return oldMainGoalResponse;
    }
    return null;

  }
}