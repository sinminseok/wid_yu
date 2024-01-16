

import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/User.dart';


class OldFamilyManagerController extends GetxController {
  Rx<User> _myUser = User("보호자", null,null,null,null,null).obs;
  RxList<User> _olds = [User("보호자", null,null,null,null,null)].obs;

  User get myUser => _myUser.value;

  List<User> get olds => _olds.value;
}