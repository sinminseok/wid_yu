
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/young/family-manager/dto/OldInformationResponseDto.dart';
import '../../../../common/urls/CommonApiUrl.dart';
import '../../dto/YoungInformationResponseDto.dart';

class FamilyManagerApi with ChangeNotifier {
  final String SEARCH_ALL_USER  = ROOT_API + "guardian/info/with-seniors";

  Future<List<YoungInformationResponseDto>> searchYoungs() async{
    List<YoungInformationResponseDto> answer = [];

    final prefs = await SharedPreferences.getInstance();

    var session =await prefs.getString("session");

    var response = await http.get(
      Uri.parse(SEARCH_ALL_USER),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );



    if(response.statusCode == 200){
      List<YoungInformationResponseDto> answer = [];

      if(json.decode(utf8.decode(response.bodyBytes))["data"]["guardianDetailResponseDtos"].length != 0){
        answer =  List<YoungInformationResponseDto>.from(json.decode(utf8.decode(response.bodyBytes))["data"]["guardianDetailResponseDtos"].map((x) => YoungInformationResponseDto.fromJson(x)));
      }

      answer.add(YoungInformationResponseDto.fromJson(json.decode(utf8.decode(response.bodyBytes))["data"]["apiUserResponseDto"]));

      return answer;
    }


    return answer;
  }

  Future<List<OldInformationResponseDto>> searchOlds() async{
    List<OldInformationResponseDto> answer = [];

    final prefs = await SharedPreferences.getInstance();

    var session =await prefs.getString("session");

    var response = await http.get(
      Uri.parse(SEARCH_ALL_USER),
      headers: {
        'Cookie': 'JSESSIONID=$session', // 세션을 쿠키로 전달
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    //young
    print(json.decode(utf8.decode(response.bodyBytes))["data"]["seniorDetailResponseDtos"]);

    if(response.statusCode == 200){
      List<OldInformationResponseDto> answer = [];
      answer =  List<OldInformationResponseDto>.from(json.decode(utf8.decode(response.bodyBytes))["data"]["seniorDetailResponseDtos"].map((x) => OldInformationResponseDto.fromJson(x)));
      return answer;
    }

    return answer;
  }
}