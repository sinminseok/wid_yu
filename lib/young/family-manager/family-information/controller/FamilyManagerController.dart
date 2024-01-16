

import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';

class FamilyManagerByYoungController extends GetxController {
  Rx<YoungUser> _myUser = YoungUser.empty().obs;
  RxList<OldUser> _olds = [OldUser.empty(),OldUser.empty(),OldUser.empty()].obs;

  YoungUser get myUser => _myUser.value;

  List<OldUser> get olds => _olds.value;
}