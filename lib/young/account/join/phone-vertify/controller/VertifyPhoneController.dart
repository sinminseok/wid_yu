
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationPhoneController extends GetxController{
  //본인인증 관련 필드
  RxBool _canInputVertifyNumber = false.obs;
  RxBool _isCheckAgree = false.obs;
  RxInt _isRightPhoneNumberFormat = 0.obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();


  void sendVertifyNumber(){
    _canInputVertifyNumber.value = true;
  }


  void checkAgree(bool value){
    _isCheckAgree.value = value;
  }

  bool validateRightPhoneNumerFormat() {
    // 정규식을 사용하여 휴대폰 번호의 올바른 포맷인지 확인
    RegExp regex = RegExp(r'^010\s\d{4}\s\d{4}$');
    var hasMatch = regex.hasMatch(phoneNumberController.text);

    if(hasMatch){
      _isRightPhoneNumberFormat.value = 1;
    } else {
      _isRightPhoneNumberFormat.value = -1;
    }

    return hasMatch;
  }


  bool get agree => _isCheckAgree.value;

  int get isRightPhoneNumberFormat => _isRightPhoneNumberFormat.value;

  bool get canInputVertifyNumber => _canInputVertifyNumber.value;

  bool get isCheckAgree => _isCheckAgree.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get verifyNumberController => _verifyNumberController;

}