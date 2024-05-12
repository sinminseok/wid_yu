
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FindPasswordController extends GetxController{
  RxInt _isSuccessFind = 0.obs;
  RxBool _isSendNumber = false.obs;
  RxBool _isVertify = false.obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  void clickFindPw(){
    _isSuccessFind.value = -1;
  }

  void sendNumber(){
    _isSendNumber.value = true;
  }

  void successVertify(){
    _isVertify.value = true;
  }


  bool get isVertify => _isVertify.value;

  bool get isSendNumber => _isSendNumber.value;

  int get isSuccessFind => _isSuccessFind.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get verifyNumberController => _verifyNumberController;
}