

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/api/CommonApiUrl.dart';
import 'package:http/http.dart' as http;
import '../../../../final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';

class OldAlbumApi with ChangeNotifier {
  final String OLD_ALBUM_LOAD_API = ROOT_API + "reward/all";

  Future<List<YoungRewardReadResponse>> loadAllReward() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<YoungRewardReadResponse> rewards = [];
    var session = await prefs.getString("session");


    var response = await http.get(
      Uri.parse(OLD_ALBUM_LOAD_API),
      headers: {
        'Cookie': 'JSESSIONID=36C271D9511C0C5AB43CCB6154A9BEEF',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );


    print(json.decode(utf8.decode(response.bodyBytes)));

    if (response.statusCode == 200) {
      rewards = List<YoungRewardReadResponse>.from(json
          .decode(utf8.decode(response.bodyBytes))["data"]
          .map((x) => YoungRewardReadResponse.fromJson(x)));
    }

    return rewards;
  }
}