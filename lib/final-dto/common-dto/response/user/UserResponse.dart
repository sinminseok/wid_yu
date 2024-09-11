

import '../goal/GoalResponse.dart';
import 'UserType.dart';

//최종
class UserResponse {
  String? _name;
  String? _profileImageUrl;
  double? _percentage;
  UserType? _userType;
  List<GoalResponse>? goals;

  //UserResponse("name", "url", 10, UserType.GUARDIAN, [])
  UserResponse(this._name, this._profileImageUrl, this._percentage,
      this._userType, this.goals);

  UserType? get userType => _userType;

  double? get percentage => _percentage;

  String? get profileImageUrl => _profileImageUrl;

  String? get name => _name;
}