// import 'dart:convert';
//
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../../common/api/CommonApiUrl.dart';
// import '../../../../../dto/old-dto/request/OldGeneratorRequest.dart';
// import '../dto/OldLoginDto.dart';
//
// class OldInformationApi with ChangeNotifier {
//
//   //todo
//   Future<OldLoginDto?> createOldAccount(
//       OldGeneratorRequest oldGeneratorRequest) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? userIdx =await prefs.getInt("userIdx");
//     var response = await http.post(
//       Uri.parse(ROOT_API + "senior/register/${userIdx}"),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: json.encode(oldGeneratorRequest.toJson()), // OldGeneratorRequest를 JSON으로 인코딩하여 전송
//     );
//
//     print(json.encode(oldGeneratorRequest.toJson()));
//
//     print(response.body);
//     Map<String, dynamic> responseData = json.decode(response.body);
//     String? data = responseData['data'];
//
//     print(data);
//
//     // if (response.statusCode == 200) {
//     //   Map<String, dynamic> responseData = json.decode(response.body);
//     //   String? data = responseData['data']; // "data" 키에 해당하는 값을 추출
//     //   return OldLoginDto(data, oldGeneratorRequest.name);
//     // }
//     return null;
//   }
// }
