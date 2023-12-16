
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneNumberEditByController extends GetxController {
  //보호자 인증 관련 컨트롤러
  RxBool _canInputVertifyNumber = false.obs;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  void sendVertifyNumber(){
    _canInputVertifyNumber.value = true;
  }


  bool get canInputVertifyNumber => _canInputVertifyNumber.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get verifyNumberController => _verifyNumberController;
}