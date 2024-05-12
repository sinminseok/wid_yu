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

  Future<YoungMainGoalResponse?> editYoungProfile(YoungEditProfileRequest dto) async {

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

    print(response.body);
  }
}
