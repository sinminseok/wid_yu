

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FindIdController extends GetxController{

  RxBool _canInputVerifyNumber = false.obs;
  RxBool _isSendNumber = false.obs;
  RxInt _isSuccessFind = 0.obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  void findId(){
    _isSuccessFind.value = -1;
  }

  void sendNumber() {
    _isSendNumber.value = false;
    _isSendNumber.value = true;
  }

 // bool get canInputVerifyNumber => _canInputVerifyNumber.value;

  int get isSuccessFind => _isSuccessFind.value;


  bool get canInputVerifyNumber => _canInputVerifyNumber.value;


  bool get isSendNumber => _isSendNumber.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get verifyNumberController => _verifyNumberController;
}