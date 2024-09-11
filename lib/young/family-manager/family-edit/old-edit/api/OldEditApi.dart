import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:wid_yu/common/urls/CommonApiUrl.dart';

import '../dto/OldEditDiseaseRequest.dart';
import '../dto/OldEditProfileRequest.dart';

class OldEditApi with ChangeNotifier {
  final String OLD_EDIT_URL = ROOT_API + "guardian/profile/of-senior/";
  final String OLD_EDIT_PROFILE_URL = ROOT_API + "senior/profile/image";

  final String ADD_DISEASE_URL = ROOT_API + "senior/disease/of-senior/";
  final String DELETE_DISEASE_URL = ROOT_API + "senior/profile/image";

  Future<bool> addDisease(OldEditDiseaseRequest disease, int userIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response =
        await http.post(Uri.parse(ADD_DISEASE_URL + userIdx.toString()),
            headers: {
              'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode(disease.toJson()));

    print(utf8.decode(response.bodyBytes));
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    }

    return true;
  }

  Future<bool> deleteDisease(int diseaseIdx, int userIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    var response = await http.delete(
      Uri.parse(ROOT_API +
          "senior/disease/" +
          diseaseIdx.toString() +
          "/of-senior/" +
          userIdx.toString()),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return true;
  }

  Future<bool?> editProfileByYoung(
      OldEditProfileRequest dto, int userIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    print(dto.toJson());

    var response =
        await http.patch(Uri.parse(OLD_EDIT_URL + userIdx.toString()),
            headers: {
              'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode(dto.toJson()));

    print(utf8.decode(response.bodyBytes));
    print(response.statusCode);
    return true;
  }

  Future<bool> editProfileImageByYoung(String urlPath, int userIdx) async {
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
    var formData = http.MultipartRequest(
        'PATCH',
        Uri.parse(ROOT_API +
            "guardian/profile/image/of-senior/${userIdx.toString()}"));

    formData.files.add(file);

    // 헤더 설정
    formData.headers.addAll({
      'Cookie': 'JSESSIONID=$session',
    });

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());

    print(utf8.decode(response.bodyBytes));

    //{"success":true,"message":"리워드 추가 완료","data":[{"rewardIdx":0,"userIdx":160,"uploaderIdx":159,"description":"asd","type":"IMAGE","url":"https://widyu-bucket.s3.ap-northeast-2.amazonaws.com/IMG_20240519_004730.jpg","status":0,"point":30,"profileImageUrl":null}]}

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool?> editProfileByOld(OldEditProfileRequest dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var session = await prefs.getString("session");

    print(dto.toJson());

    var response = await http.patch(Uri.parse(ROOT_API + "senior/profile"),
        headers: {
          'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(dto.toJson()));

    print(utf8.decode(response.bodyBytes));
    print(response.statusCode);
    return true;
  }

  Future<bool> editProfileImageByOld(String urlPath) async {
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
    var formData = http.MultipartRequest(
        'PATCH', Uri.parse(ROOT_API + "senior/profile/image"));

    formData.files.add(file);

    // 헤더 설정
    formData.headers.addAll({
      'Cookie': 'JSESSIONID=$session',
    });

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());

    print(utf8.decode(response.bodyBytes));

    //{"success":true,"message":"리워드 추가 완료","data":[{"rewardIdx":0,"userIdx":160,"uploaderIdx":159,"description":"asd","type":"IMAGE","url":"https://widyu-bucket.s3.ap-northeast-2.amazonaws.com/IMG_20240519_004730.jpg","status":0,"point":30,"profileImageUrl":null}]}

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
