import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:wid_yu/old/health-information/dto/OldHealthResponse.dart';
import '../../../../common/api/CommonApiUrl.dart';
import '../../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';
import 'package:flutter/cupertino.dart';

import '../dto/HealthAllResponse.dart';


class YoungHealthApi with ChangeNotifier {
  final String LOAD_HEALTH_URL = ROOT_API + "health/info/of-seniors/main";


  Future<List<OldHealthResponse>?> loadMainPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    var response = await http.get(
      Uri.parse(LOAD_HEALTH_URL),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("----");
    print(utf8.decode(response.bodyBytes));


    if (response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(
          utf8.decode(response.bodyBytes));
      if (jsonResponse['success']) {
        List<
            dynamic> data = jsonResponse['data']['seniorMainHealthResponseList'];
        List<OldHealthResponse> healthResponses = data.map((item) =>
            OldHealthResponse.fromJson(item)).toList();
        return healthResponses;
      } else {
        print("Error: ${jsonResponse['message']}");
      }
    } else {
      print("Failed to load data. Status code: ${response.statusCode}");
    }
    return null;
  }

  Future<HealthAllResponse?> loadDetailInformation(int seniorIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    var response = await http.get(
      Uri.parse(ROOT_API + "health/info/of-senior/" + seniorIdx.toString() +
          "/detail"),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 201) {
      return HealthAllResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    } else {
      print("Failed to load data. Status code: ${response.statusCode}");
    }
    return null;
  }

}
