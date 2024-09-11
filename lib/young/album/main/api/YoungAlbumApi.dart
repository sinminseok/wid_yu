import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/urls/CommonApiUrl.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';


class YoungAlbumApi with ChangeNotifier {
  final String LOAD_ALL_REWARD_URL = ROOT_API+"reward/guardian/all";

  final String DELETE_REWARD_URL = ROOT_API + "reward/delete/";

  Future<bool> deleteReward(int rewardIdx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = await prefs.getString("session");

    var response = await http.delete(
      Uri.parse(DELETE_REWARD_URL + "${rewardIdx}"),
      headers: {
        'Cookie': 'JSESSIONID=$session',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print("---------");
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }



  Future<List<YoungRewardReadResponse>> loadAllReward() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<YoungRewardReadResponse> rewards = [];
    var session = await prefs.getString("session");


    var response = await http.get(
      Uri.parse(LOAD_ALL_REWARD_URL),
      headers: {
        'Cookie': 'JSESSIONID=$session',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      rewards = List<YoungRewardReadResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => YoungRewardReadResponse.fromJson(x)));
    }



    return rewards;
  }
}
