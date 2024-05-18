import 'OldDiseaseResponse.dart';

class OldInformationResponseDto {
  int? _userIdx;
  String? _name;
  String? _profileImageUrl;
  String? _userType;
  String? _id;
  String? _inviteCode;
  String? _phoneNumber;
  String? _address;
  String? _birth;
  int? _isDisease;
  List<OldDiseaseResponse>? _diseases;

  OldInformationResponseDto({
    required int? userIdx,
    required String? name,
    required String? profileImageUrl,
    required String? userType,
    required String? id,
    required String? inviteCode,
    required String? phoneNumber,
    required String? address,
    required String? birth,
    required int? isDisease,
    required List<OldDiseaseResponse>? diseases,
  })  : _userIdx = userIdx,
        _name = name,
        _inviteCode = inviteCode,
        _profileImageUrl = profileImageUrl,
        _userType = userType,
        _id = id,
        _phoneNumber = phoneNumber,
        _address = address,
        _birth = birth,
        _isDisease = isDisease,
        _diseases = diseases;

  factory OldInformationResponseDto.fromJson(Map<String, dynamic> json) {
    return OldInformationResponseDto(
      userIdx: json['userIdx'] as int?,
      name: json['name'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      userType: json['userType'] as String?,
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      birth: json['birth'] as String?,
      isDisease: json['isDisease'] as int?,
      diseases: (json['diseases'] as List<dynamic>?)
          ?.map((e) => OldDiseaseResponse.fromJson(e as Map<String, dynamic>))
          .toList(), inviteCode: json['inviteCode'],
    );
  }

  List<OldDiseaseResponse>? get diseases => _diseases;

  int? get isDisease => _isDisease;

  String? get birth => _birth;

  String? get address => _address;

  String? get phoneNumber => _phoneNumber;

  String? get id => _id;

  String? get userType => _userType;

  String? get profileImageUrl => _profileImageUrl;


  String? get inviteCode => _inviteCode;

  String? get name => _name;

  int? get userIdx => _userIdx;
}
