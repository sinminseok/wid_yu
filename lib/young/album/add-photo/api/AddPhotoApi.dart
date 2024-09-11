import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

import '../../../../common/urls/CommonApiUrl.dart';
import '../../../../final-dto/young-dto/request/reward/YoungRewardGeneratorRequest.dart';

class AddPhotoApi {
  String get CREATE_PHOTO_REWARD => ROOT_API + "reward/insert";

  Future<bool> createPhotoReward(YoungRewardGeneratorRequest reward, String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString("session");

    // 파일 경로 가져오기
    String filePath = reward.url!;

    // 파일 생성
    var file = await http.MultipartFile.fromPath(
      'url',
      filePath,
      contentType: MediaType('image', 'jpeg'), // 파일 타입 지정 (이미지인 경우)
    );

    // 폼 데이터 생성
    var formData =
        http.MultipartRequest('POST', Uri.parse(CREATE_PHOTO_REWARD));
    formData.fields.addAll({

      //'userIdx': reward.userIdx.toString(),
      'description': reward.description!,
      'type' : '${type}'

    });
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
