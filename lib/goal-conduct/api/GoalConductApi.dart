
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../final-dto/common-dto/response/goal/GoalTimeResponse.dart';

class GoalConductApi {
  String CONDUCT_GOAL_URL = ROOT_API + "goals/success/";
  String UPLOAD_DRUG_IMAGE = ROOT_API + "s3/goal/insert/";

  Future<bool> uploadDrugImage(GoalTimeResponse goalTimeResponse, String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    // 파일 경로 가져오기

    // 파일 생성
    var file = await http.MultipartFile.fromPath(
      'url',
      imagePath,
      contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
    );

    // 폼 데이터 생성
    var formData = http.MultipartRequest('POST', Uri.parse(UPLOAD_DRUG_IMAGE+"${goalTimeResponse.goalStatusIdx}"));

    formData.files.add(file);

    // 헤더 설정
    formData.headers.addAll({
      'Cookie': 'JSESSIONID=$session',
    });

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());

    print("object");
    print(response.statusCode);
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> successGoal(GoalTimeResponse goalTimeResponse)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.patch(Uri.parse(CONDUCT_GOAL_URL+"${goalTimeResponse.goalStatusIdx}"),
        headers: {
          'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
          'Content-Type': 'application/json',
        });

    print("dasd");
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}