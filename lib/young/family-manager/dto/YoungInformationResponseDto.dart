class YoungInformationResponseDto {
  int? _userIdx;
  String? _name;
  String? _profileImageUrl;
  String? _userType;
  String? _id;
  String? _phoneNumber;
  String? _address;
  String? _birth;



  YoungInformationResponseDto({
    required int? userIdx,
    required String? name,
    required String? profileImageUrl,
    required String? userType,
    required String? id,
    required String? phoneNumber,
    required String? address,
    required String? birth,
  })  : _userIdx = userIdx,
        _name = name,
        _profileImageUrl = profileImageUrl,
        _userType = userType,
        _id = id,
        _phoneNumber = phoneNumber,
        _address = address,
        _birth = birth;

  factory YoungInformationResponseDto.fromJson(Map<String, dynamic> json) {
    return YoungInformationResponseDto(
      userIdx: json['userIdx'] as int?,
      name: json['name'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      userType: json['userType'] as String?,
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      birth: json['birth'] as String?,
    );
  }

  String? get birth => _birth;

  String? get address => _address;

  String? get phoneNumber => _phoneNumber;

  String? get id => _id;

  String? get userType => _userType;

  String? get profileImageUrl => _profileImageUrl;

  String? get name => _name;

  int? get userIdx => _userIdx;

}

final YoungInformationResponseDto dubby = YoungInformationResponseDto(userIdx: 1, name: "12", profileImageUrl: "profileImageUrl", userType: "userType", id: "dsa", phoneNumber: "phoneNumber", address: "address", birth: "birth");


