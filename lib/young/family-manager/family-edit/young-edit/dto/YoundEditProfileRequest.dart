

class YoungEditProfileRequest {
  String? _name;
  String? _profileImageUrl;
  String? _phoneNumber;
  String? _address;
  String? _birth;

  YoungEditProfileRequest({
    required String? name,
    required String? profileImageUrl,
    required String? phoneNumber,
    required String? address,
    required String? birth,
  })  : _name = name,
        _profileImageUrl = profileImageUrl,
        _phoneNumber = phoneNumber,
        _address = address,
        _birth = birth;

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'profileImageUrl': _profileImageUrl,
      'phoneNumber': _phoneNumber,
      'address': _address,
      'birth': _birth,
    };
  }

}
