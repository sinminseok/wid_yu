import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/YoungMainGoalResponse.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/dto/YoundEditProfileRequest.dart';

class YoungEditApi with ChangeNotifier {

  final String YOUNG_EDIT_URL = ROOT_API + "guardian/profile";
  final String YOUNG_PROFILE_EDIT_URL = ROOT_API + "guardian/profile/image";

  Future<bool?> editYoungProfile(YoungEditProfileRequest dto) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.patch(
      Uri.parse(YOUNG_EDIT_URL),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(dto.toJson())
    );

    print(utf8.decode(response.bodyBytes));
  }

  Future<bool> editProfileUrl(String urlPath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    // 파일 경로 가져오기

    // 파일 생성
    var file = await http.MultipartFile.fromPath(
      'url',
      urlPath,
      contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
    );

    // 폼 데이터 생성
    var formData =
    http.MultipartRequest('PATCH', Uri.parse(YOUNG_PROFILE_EDIT_URL));

    formData.files.add(file);

    // 헤더 설정
    formData.headers.addAll({
      'Cookie': 'JSESSIONID=$session',
    });

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());


    print("GIGGIGIGI");
    print(utf8.decode(response.bodyBytes));

    //{"success":true,"message":"리워드 추가 완료","data":[{"rewardIdx":0,"userIdx":160,"uploaderIdx":159,"description":"asd","type":"IMAGE","url":"https://widyu-bucket.s3.ap-northeast-2.amazonaws.com/IMG_20240519_004730.jpg","status":0,"point":30,"profileImageUrl":null}]}

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
