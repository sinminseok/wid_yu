import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/urls/CommonApiUrl.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/PercentageOfDay.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/YoungMainGoalResponse.dart';

import '../../../../final-dto/young-dto/response/user/OldResponseByYoung.dart';

class YoungGoalApi with ChangeNotifier {
  final String YOUNG_TODAY_PERCENTAGE = ROOT_API + 'goals/rate/today/';
  final String TODAY_POINT = ROOT_API + "goals/point/today/";
  final String YOUNG_MONTH_PERCENTAGE = ROOT_API + "goals/rate/montly/";

  Future<double> loadPercentage(int userIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.get(
      Uri.parse(YOUNG_TODAY_PERCENTAGE + userIdx.toString()),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {

      var jsonResponse = json.decode(utf8.decode(response.bodyBytes));

        var data = jsonResponse['data'];
        // Convert the data to a double and return it
        return data is double ? data : double.tryParse(data.toString()) ?? 0.0;

    } else {
      print('Failed todasdas load data: ${response.statusCode}');
    }

    // Return a default value if the request fails or the data is invalid
    return 0.0;
  }

  Future<int> loadTodayPoint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? uerIdx = await prefs.getInt("user_idx");
    var session = await prefs.getString("session");

    var response = await http.get(
      Uri.parse(TODAY_POINT + uerIdx.toString()),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("DASDASDASDASDASD");
    print(utf8.decode(response.bodyBytes));

    if(response.statusCode == 200){

    }


    return 1;
  }

  Future<List<PercentageOfDay>> loadMonthPercentage(int userIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;

    // Get the number of days in the current month
    int daysInMonth = DateTime(year, month + 1, 0).day;

    List<PercentageOfDay> answer = List.generate(daysInMonth, (index) => PercentageOfDay(index + 1, 0.0));

    var session = await prefs.getString("session");

    var response = await http.get(
      Uri.parse(YOUNG_MONTH_PERCENTAGE + userIdx.toString() + "/" + month.toString()),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      if (jsonResponse['success'] == true) {
        var data = jsonResponse['data'] as List;
        for (var item in data) {
          PercentageOfDay pod = PercentageOfDay.fromJson(item);
          // Update the answer list with the actual percentage for the specific day
          answer[pod.day - 1] = pod;
        }
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }

    return answer;
  }
}
