
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/utils/Converter.dart';

import '../../../../../common/urls/CommonApiUrl.dart';


class PhoneEditApi with ChangeNotifier {
  static String SEND_SMS_NUMBER_URL = ROOT_API + "sms/send";
  static String CHECK_SMS_NUMBER_URL = ROOT_API + "sms/verify/";
  static String JOIN_YOUNG_URL = ROOT_API + "guardian/register";
  static String JOIN_OLD_URL = ROOT_API + "senior/register/";
  static String CHECK_DUPLICATE_ID_URL = ROOT_API + "senior/find/guardians/";


  // 인증번호 전송 api
  Future<bool> sendVerificationCode(String name, String phoneNumber) async {
    // var response = await http.post(Uri.parse(SEND_SMS_NUMBER_URL),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //     },
    //     body: json.encode({
    //       //todo 변경
    //       'name': "신민석",
    //       'phoneNumber': "01083131764",
    //     }));
    //
    // print(response.body);
    //
    // if (response.statusCode == 200) {
    //   return true;
    // }
    return false;
  }

  // 인증번호 확인 api
  Future<bool> checkVerificationCode(
      String certificationCode, String phoneNumber) async {
    // print(certificationCode);
    // phoneNumber = phoneNumber.replaceAll(RegExp('\\s'), "");
    // var response =
    // await http.post(Uri.parse(CHECK_SMS_NUMBER_URL + phoneNumber),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //     },
    //     body: json.encode({
    //       'certificationCode': certificationCode,
    //     }));
    //
    // print(response.body);
    // if (response.statusCode == 200) {
    //   return true;
    // }
    return false;
  }
}