
class UserSelectResponse {
  String? _name;
  int? _userIdx;

  UserSelectResponse(this._name, this._userIdx);

  int? get userIdx => _userIdx;

  String? get name => _name;
}