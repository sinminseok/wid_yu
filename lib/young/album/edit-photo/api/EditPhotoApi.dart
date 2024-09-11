import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/urls/CommonApiUrl.dart';
import 'package:http_parser/http_parser.dart';

import '../dto/EditRewardRequest.dart';


class EditPhotoApi with ChangeNotifier{
  final String EDIT_REWARD_URL = ROOT_API + "reward/update/info";

  Future<bool> editFile(int idx, String filePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    // 폼 데이터 생성
    var formData =
    http.MultipartRequest('PATCH', Uri.parse(ROOT_API + "reward/update/file"));
    formData.fields.addAll({
      'rewardIdx': idx.toString(),
    });

    var file = await http.MultipartFile.fromPath(
      'url',
      filePath,
      contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
    );

    // 헤더 설정
    formData.headers.addAll({
      'Cookie': 'JSESSIONID=$session',
    });
    formData.files.add(file);
    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());



    //{"success":true,"message":"리워드 추가 완료","data":[{"rewardIdx":0,"userIdx":160,"uploaderIdx":159,"description":"asd","type":"IMAGE","url":"https://widyu-bucket.s3.ap-northeast-2.amazonaws.com/IMG_20240519_004730.jpg","status":0,"point":30,"profileImageUrl":null}]}

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> editInformation(EditRewardRequest dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    // 폼 데이터 생성
    var formData =
    http.MultipartRequest('PATCH', Uri.parse(EDIT_REWARD_URL));
    formData.fields.addAll({
      "rewardIdx" : dto.rewardIdx.toString(),
      "description" : dto.description.toString(),
      "type" : dto.type.toString(),

    });

    // 헤더 설정
    formData.headers.addAll({
      'Cookie': 'JSESSIONID=$session',
    });

    // 요청 보내기
    var response = await http.Response.fromStream(await formData.send());


    print("dasdasd");
    print(utf8.decode(response.bodyBytes));

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}