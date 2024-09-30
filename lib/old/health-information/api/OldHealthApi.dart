import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:wid_yu/final-dto/old-dto/response/OldHealthResponse.dart';
import '../../../common/urls/CommonApiUrl.dart';
import '../../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';
import 'package:flutter/cupertino.dart';

import '../../../young/health-infroamtion/dto/HealthAllResponse.dart';
import '../../../final-dto/old-dto/response/OldHealthDetailResponse.dart';

class OldHealthApi with ChangeNotifier {
  final String LOAD_HEALTH_URL = ROOT_API + "health/info/of-senior/main";
  final String LOAD_HEALTH_DETAIL_URL = ROOT_API + "health/info/of-senior/HEARTBIT";

  Future<bool> sendPositionInit(double latitude, double longitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    var response = await http.patch(
      Uri.parse(ROOT_API + 'health/update/location'),
      headers: {
        'Cookie': 'JSESSIONID=$session',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'latitude': latitude,
        'longitude': longitude,
      }),
    );


    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to send position: ${response.statusCode}');
      return false;
    }
  }


  Future<OldHealthResponse?>? loadMainPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.get(
      Uri.parse(LOAD_HEALTH_URL),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    if(response.statusCode == 201){
      return OldHealthResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }

  Future<OldHealthDetailResponse?>? loadDetailPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.get(
      Uri.parse(LOAD_HEALTH_DETAIL_URL),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("object");
    print(utf8.decode(response.bodyBytes));



    if(response.statusCode == 201){
      return OldHealthDetailResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    }
    return null;
  }


  Future<HealthAllResponse?> loadDetailInformation(int seniorIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    var response = await http.get(
      Uri.parse(ROOT_API + "health/info/of-senior/detail"),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 201) {
      return HealthAllResponse.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);
    } else {
      print("Failed to load data. Status code: ${response.statusCode}");
    }
    return null;
  }

  void sendHeartBit()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.post(Uri.parse(ROOT_API+"health/append/heart-bit"),
        headers: {
          'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
          'Content-Type': 'application/json',
        },
      body: jsonEncode({
        'heartBit': 91.4,
      }));


  }
}
