class Disease {
  int diseaseIdx;
  String? name;
  String? drugName;
  String? explanation;
  String? favoriteHospital;
  String? dosageTime;

  Disease({
    required this.diseaseIdx,
    this.name,
    this.drugName,
    this.explanation,
    this.favoriteHospital,
    this.dosageTime,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      diseaseIdx: json['diseaseIdx'],
      name: json['name'],
      drugName: json['drugName'],
      explanation: json['explanation'],
      favoriteHospital: json['favoriteHospital'],
      dosageTime: json['dosageTime'],
    );
  }
}

class UserResponse {
  int userIdx;
  String name;
  String? profileImageUrl;
  String userType;
  String inviteCode;
  String phoneNumber;
  String address;
  String birth;
  int isDisease;
  List<Disease> diseases;

  UserResponse({
    required this.userIdx,
    required this.name,
    required this.profileImageUrl,
    required this.userType,
    required this.inviteCode,
    required this.phoneNumber,
    required this.address,
    required this.birth,
    required this.isDisease,
    required this.diseases,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var diseasesList = json['diseases'] as List;
    List<Disease> diseases = diseasesList.map((diseaseJson) => Disease.fromJson(diseaseJson)).toList();

    return UserResponse(
      userIdx: json['userIdx'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      userType: json['userType'],
      inviteCode: json['inviteCode'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      birth: json['birth'],
      isDisease: json['isDisease'],
      diseases: diseases,
    );
  }
}

class YoungInfo {
  int userIdx;
  String name;
  String? profileImageUrl;
  String userType;
  String id;
  String phoneNumber;
  String? address;
  String? birth;

  YoungInfo({
    required this.userIdx,
    required this.name,
    this.profileImageUrl,
    required this.userType,
    required this.id,
    required this.phoneNumber,
    this.address,
    this.birth,
  });

  factory YoungInfo.fromJson(Map<String, dynamic> json) {
    return YoungInfo(
      userIdx: json['userIdx'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      userType: json['userType'],
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      birth: json['birth'],
    );
  }
}

class HealthAllResponse {
  UserResponse responseOldHealthDto;
  double heartBit;
  List<YoungInfo> responseYoungInfoDto;

  HealthAllResponse({
    required this.responseOldHealthDto,
    required this.heartBit,
    required this.responseYoungInfoDto,
  });

  factory HealthAllResponse.fromJson(Map<String, dynamic> json) {
    var youngInfoList = json['ResponseYoungInfoDto'] as List;
    List<YoungInfo> youngInfos = youngInfoList.map((youngJson) => YoungInfo.fromJson(youngJson)).toList();

    return HealthAllResponse(
      responseOldHealthDto: UserResponse.fromJson(json['ResponseOldHealthDto']),
      heartBit: json['heartBit'],
      responseYoungInfoDto: youngInfos,
    );
  }
}
