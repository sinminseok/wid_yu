
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';

class AddYoungController extends GetxController {
  RxList<YoungUser> _findUsers = <YoungUser>[].obs;

  TextEditingController _findIdController = TextEditingController();

  TextEditingController get findIdController => _findIdController;
  
  void findYoungUser(){
    _findUsers.value.clear();
    _findUsers.add(YoungUser.empty());
  }

  RxList<YoungUser> get findUsers => _findUsers;
}