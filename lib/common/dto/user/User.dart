
import 'package:wid_yu/common/dto/health/Health.dart';

import '../goal/Goal.dart';
import 'UserType.dart';

class User{
   String? _name;
   String? _phoneNumber;
   String? _brith;
   String? _address;
   UserType? _userType;
   List<Goal>? _goals;

   User(this._name, this._phoneNumber, this._brith, this._address,
      this._userType, this._goals);

   List<Goal>? get goals => _goals;

  UserType? get userType => _userType;

  String? get address => _address;

  String? get brith => _brith;

  String? get phoneNumber => _phoneNumber;

  String? get name => _name;
}