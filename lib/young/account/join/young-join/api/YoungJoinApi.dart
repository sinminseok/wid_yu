// import 'dart:convert';
//
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../../common/api/CommonApiUrl.dart';
//
// class YoungJoinApi with ChangeNotifier {
//   final String CREATE_YOUNG_URL = ROOT_API;
//
//   Future<bool> createYoungAccount(String id, String pw) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     var response = await http.post(Uri.parse(CREATE_YOUNG_URL+"guardian/register"),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: json.encode({
//           'id': id,
//           'password': pw,
//         }));
//
//
//
//     if (response.statusCode == 201) {
//       // 응답 데이터를 JSON으로 디코딩
//       Map<String, dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));
//
//       // "data" 부분만 추출
//       Map<String, dynamic> data = responseData['data'];
//       int idx = data['userIdx'];
//
//       prefs.setString("young_join_id", id);
//       prefs.setInt("userIdx", idx);
//       return true;
//     }
//     return false;
//   }
//
//
//   Future<bool> checkDuplicateId(String id) async {
//     var response = await http.get(
//       Uri.parse(CREATE_YOUNG_URL + "senior/find/guardians/${id}"),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//     );
//
//     print(jsonDecode(utf8.decode(response.bodyBytes)));
//     // 응답 데이터를 JSON으로 디코딩
//     Map<String, dynamic> responseData =
//         jsonDecode(utf8.decode(response.bodyBytes));
//
//     // "data" 부분만 추출
//
//     if (response.statusCode == 200) {
//       if (responseData['data'] == null) {
//
//         return true;
//       }
//       return false;
//     }
//     return false;
//   }
// }
