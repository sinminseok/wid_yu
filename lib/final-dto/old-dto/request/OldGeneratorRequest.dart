
import 'package:wid_yu/common/utils/Converter.dart';

import 'OldDiseaseRequest.dart';

class OldGeneratorRequest{
  String? name;
  String? birth;
  String? phoneNumber;
  String? address;
  int? isDisease;
  int? age;
  List<OldDiseaseRequest>? diseases;


  OldGeneratorRequest({
    required this.name,
    required this.birth,
    required this.phoneNumber,
    required this.address,
    required this.isDisease,
    required this.diseases,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> diseaseList =
    diseases!.map((disease) => disease.toJson()).toList();

    return {
      "name": name,
      "birth": birth, // 오타 수정: brith -> birth
      "phoneNumber": ConverterCutom.toServerPhoneNumber(phoneNumber!),
      "age": 20, // 나이는 birth 기반으로 계산
      "address": address,
      "isDisease": isDisease,
      "diseases": diseaseList,
    };
  }
}