
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class YoungIdFindApi extends ChangeNotifier{
  final YOUNG_LOGIN_URL = "";


  Future<bool> findId(String name, String phoneNumber) async {
    var response = await http.post(Uri.parse(YOUNG_LOGIN_URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'phoneNumber': phoneNumber,
        }));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

}