
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/model/user/User.dart';

class AddYoungController extends GetxController {
  RxList<User> _findUsers = <User>[].obs;

  TextEditingController _findIdController = TextEditingController();

  TextEditingController get findIdController => _findIdController;
  
  void findYoungUser(){
    _findUsers.value.clear();
    _findUsers.add(User("보호자2님", "@ID", "123", "123"));
  }

  RxList<User> get findUsers => _findUsers;
}