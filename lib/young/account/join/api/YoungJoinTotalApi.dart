import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/utils/Converter.dart';

import '../../../../common/api/CommonApiUrl.dart';
import '../../../../dto/old-dto/request/OldGeneratorRequest.dart';
import '../old-information/dto/OldLoginDto.dart';

class YoungJoinTotalApi with ChangeNotifier {
  static String SEND_SMS_NUMBER_URL = ROOT_API + "sms/send";
  static String CHECK_SMS_NUMBER_URL = ROOT_API + "sms/verify/";
  static String JOIN_YOUNG_URL = ROOT_API + "guardian/register";
  static String JOIN_OLD_URL = ROOT_API + "senior/register/";
  static String CHECK_DUPLICATE_ID_URL = ROOT_API + "senior/find/guardians/";


  // 인증번호 전송 api
  Future<bool> sendVerificationCode(String name, String phoneNumber) async {
    var response = await http.post(Uri.parse(SEND_SMS_NUMBER_URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          //todo 변경
          'name': "신민석",
          'phoneNumber': "01083131764",
        }));

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // 인증번호 확인 api
  Future<bool> checkVerificationCode(
      String certificationCode, String phoneNumber) async {
    print(certificationCode);
    phoneNumber = phoneNumber.replaceAll(RegExp('\\s'), "");
    var response =
        await http.post(Uri.parse(CHECK_SMS_NUMBER_URL + phoneNumber),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode({
              'certificationCode': certificationCode,
            }));

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // createYoungAccount 부양자 회원가입 pai
  Future<bool> joinYoungAccount(String id, String pw, String name, String phoneNumber) async {
    print(id);
    print(pw);
    print(name);
    print(phoneNumber);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(JOIN_YOUNG_URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'id': id,
          'password': pw,
          'phoneNumber' : ConverterCutom.toServerPhoneNumber(phoneNumber),
          'name' : name,
        }));

    print(response.body);

    if (response.statusCode == 201) {
      // 응답 데이터를 JSON으로 디코딩
      Map<String, dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));

      // "data" 부분만 추출
      Map<String, dynamic> data = responseData['data'];
      int idx = data['userIdx'];

      await prefs.setString("young_join_id", id);
      await prefs.setInt("user_idx", idx);
      return true;
    }
    return false;
  }

  // 아이디 중복 체크 api
  Future<bool> checkDuplicateId(String id) async {
    var response = await http.get(
      Uri.parse(CHECK_DUPLICATE_ID_URL + "${id}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(utf8.decode(response.bodyBytes)));
    // 응답 데이터를 JSON으로 디코딩
    Map<String, dynamic> responseData =
    jsonDecode(utf8.decode(response.bodyBytes));

    // "data" 부분만 추출

    if (response.statusCode == 200) {
      if (responseData['data'] == null) {

        return true;
      }
      return false;
    }
    return false;
  }

  Future<OldLoginDto?> createOldAccount(
      OldGeneratorRequest oldGeneratorRequest) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userIdx =await prefs.getInt("userIdx");
    int? userIdx2 =await prefs.getInt("user_idx");


    var response = await http.post(
      Uri.parse(JOIN_OLD_URL +"${userIdx2}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: json.encode(oldGeneratorRequest.toJson()), // OldGeneratorRequest를 JSON으로 인코딩하여 전송
    );



    Map<String, dynamic> responseData = json.decode(response.body);
    String? data = responseData['data'];

    print(utf8.decode(response.bodyBytes));
    print(response.statusCode);

    if (response.statusCode == 201) {
      Map<String, dynamic> responseData = json.decode(response.body);
      String? data = responseData['data']; // "data" 키에 해당하는 값을 추출
      return OldLoginDto(data, oldGeneratorRequest.name);
    }
    return null;
  }
}
