

import 'package:get/get.dart';
import 'package:wid_yu/common/model/user/TestHealth.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';

class FamilyManagerController extends GetxController {
  Rx<TestUser> _myUser = TestUser("보호자", TestHealth(1,2,3), true).obs;
  RxList<TestUser> _olds = [TestUser("부모님1", TestHealth(1,2,3), true),TestUser("부모님2", TestHealth(1,2,3), true),TestUser("부모님2", TestHealth(1,2,3), true)].obs;

  TestUser get myUser => _myUser.value;

  List<TestUser> get olds => _olds.value;
}