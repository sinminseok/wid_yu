
import 'package:wid_yu/dto/old-dto/request/OldDiseaseRequest.dart';

import 'OldEditDiseaseRequest.dart';

import 'package:wid_yu/dto/old-dto/request/OldDiseaseRequest.dart';
import 'OldEditDiseaseRequest.dart';

class OldEditProfileRequest {
  String? _name;
  String? _profileImageUrl;
  String? _phoneNumber;
  String? _address;
  String? _birth;
  List<OldEditDiseaseRequest>? _diseases;

  OldEditProfileRequest({
    required String? name,
    required String? profileImageUrl,
    required String? phoneNumber,
    required String? address,
    required String? birth,
    required List<OldEditDiseaseRequest>? diseases,
  })  : _name = name,
        _profileImageUrl = profileImageUrl,
        _phoneNumber = phoneNumber,
        _address = address,
        _birth = birth,
        _diseases = diseases;

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'profileImageUrl': _profileImageUrl,
      'phoneNumber': _phoneNumber,
      'address': _address,
      'birth': _birth,
      'diseases': _diseases != null
          ? _diseases!.map((disease) => disease.toJson()).toList()
          : null,
    };
  }
}
