
import 'package:wid_yu/dto/old-dto/request/OldDiseaseRequest.dart';

import 'OldEditDiseaseRequest.dart';

import 'package:wid_yu/dto/old-dto/request/OldDiseaseRequest.dart';
import 'OldEditDiseaseRequest.dart';

class OldEditProfileRequest {
  String? _name;
  String? _phoneNumber;
  String? _address;
  String? _birth;
  List<OldEditDiseaseRequest>? _diseases;

  OldEditProfileRequest({
    required String? name,
    required String? phoneNumber,
    required String? address,
    required String? birth,
    required List<OldEditDiseaseRequest>? diseases,
  })  : _name = name,
        _phoneNumber = phoneNumber,
        _address = address,
        _birth = birth,
        _diseases = diseases;

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'phoneNumber': _phoneNumber,
      'address': _address,
      'birth': _birth,
      'diseases': _diseases != null
          ? _diseases!.map((disease) => disease.toJson()).toList()
          : null,
    };
  }

  List<OldEditDiseaseRequest>? get diseases => _diseases;

  String? get birth => _birth;

  String? get address => _address;

  String? get phoneNumber => _phoneNumber;


  String? get name => _name;
}
