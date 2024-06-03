import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/utils/Converter.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserResponse.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserType.dart';
import 'package:wid_yu/young/account/join/api/YoungJoinTotalApi.dart';

import '../../../../common/api/CommonApiUrl.dart';
import 'ProfileResponse.dart';

class AddYoungController extends GetxController {
  static String CHECK_DUPLICATE_ID_URL = ROOT_API + "senior/find/guardians/";

  RxList<ProfileResponse> _findUsers = <ProfileResponse>[].obs;

  TextEditingController _findIdController = TextEditingController();


  
  void findYoungUser(BuildContext context) async{
    ProfileResponse? response = await findIdApi();
    _findUsers.clear();
    if(response != null){

      _findUsers.add(response);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('사용자를 못 찾았습니다.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: '확인',
          onPressed: () {},
        ),
      ));

    }

    //_findUsers.value.clear();
    //_findUsers.add(UserResponse("name", "ed", 10, UserType.GUARDIAN, []));
  }

  Future<ProfileResponse?> findIdApi() async {
    var response = await http.get(
      Uri.parse(CHECK_DUPLICATE_ID_URL + "${_findIdController.text}"),
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
      return ProfileResponse.fromJson(responseData['data']);
    }
    return null;
  }

  TextEditingController get findIdController => _findIdController;

  RxList<ProfileResponse> get findUsers => _findUsers;
}