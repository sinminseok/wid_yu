
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:wid_yu/common/api/CommonApiUrl.dart';
import 'package:wid_yu/utils/Converter.dart';

import '../dto/FindIdResponse.dart';

class YoungIdFindApi extends ChangeNotifier{
  final FIND_YOUNG_ID = ROOT_API + "guardian/find/id";
  final RESET_YOUNG_PASSWORD = ROOT_API  + "guardian/find/password";


  Future<FindIdResponseDto?> findId(String name, String phoneNumber) async {
    var response = await http.post(Uri.parse(FIND_YOUNG_ID),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'phoneNumber': ConverterCutom.toServerPhoneNumber(phoneNumber),
        }));

    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      FindIdResponseDto findIdResponseDto = FindIdResponseDto.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]);

      return findIdResponseDto;
    }
    return null;
  }


  Future<bool?> resetPassword(String name, String phoneNumber, String id, String password) async {
    print(name);
    print(ConverterCutom.toServerPhoneNumber(phoneNumber));
    print(id);
    print(password);
    var response = await http.post(Uri.parse(RESET_YOUNG_PASSWORD),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'phoneNumber': ConverterCutom.toServerPhoneNumber(phoneNumber),
          'id' : id,
          'newPassword' : password
        }));

    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {

      return true;
    }
    return false;
  }

}