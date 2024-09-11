
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/urls/CommonApiUrl.dart';
import 'package:wid_yu/young/family-manager/dto/OldInformationResponseDto.dart';

import '../../../../../final-dto/old-dto/request/OldGeneratorRequest.dart';


class AddOldApi with ChangeNotifier {
  final String ADD_OLD_URL = ROOT_API + "add/seniors";


  Future<bool> addOld(OldGeneratorRequest oldGeneratorRequest) async{

    final prefs = await SharedPreferences.getInstance();

    var session =await prefs.getString("session");

    var response = await http.post(
      Uri.parse(ADD_OLD_URL),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(oldGeneratorRequest.toJson()),
    );

    //young

    if(response.statusCode == 200){
      return true;
    }

    return false;
  }

}