

import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/user/User.dart';

import 'UserType.dart';

class YoungUser extends User{

  YoungUser.empty() : super("", "", "", "", UserType.YOUNG, []);

  YoungUser(String name, String phoneNumber, String birth, String address, UserType userType, List<Goal> goals)
      : super(name, phoneNumber, birth, address, userType, goals);
}