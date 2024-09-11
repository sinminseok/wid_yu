
class UserProfileResponse{
  String _name;
  String _phoneNumber;
  String _address;
  String _brith;

  UserProfileResponse(
      this._name, this._phoneNumber, this._address, this._brith);

  String get brith => _brith;

  String get address => _address;

  String get phoneNumber => _phoneNumber;

  String get name => _name;
}

//UserProUserProfileResponsefileResponse("name", "12", "add", "21")