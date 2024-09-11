

class YoungEditProfileRequest {
  String? _name;
  String? _phoneNumber;
  String? _address;
  String? _birth;

  YoungEditProfileRequest({
    required String? name,
    required String? phoneNumber,
    required String? address,
    required String? birth,
  })  : _name = name,
        _phoneNumber = phoneNumber,
        _address = address,
        _birth = birth;

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'phoneNumber': _phoneNumber,
      'address': _address,
      'birth': _birth,
    };
  }

}
