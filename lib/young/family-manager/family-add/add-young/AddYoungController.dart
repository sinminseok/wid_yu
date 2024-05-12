
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserResponse.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserType.dart';

class AddYoungController extends GetxController {
  RxList<UserResponse> _findUsers = <UserResponse>[].obs;

  TextEditingController _findIdController = TextEditingController();

  TextEditingController get findIdController => _findIdController;
  
  void findYoungUser(){
    _findUsers.value.clear();
    _findUsers.add(UserResponse("name", "ed", 10, UserType.GUARDIAN, []));
  }

  RxList<UserResponse> get findUsers => _findUsers;
}