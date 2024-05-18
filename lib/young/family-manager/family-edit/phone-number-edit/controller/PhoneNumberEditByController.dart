
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:wid_yu/young/family-manager/family-edit/phone-number-edit/api/PhoneEditApi.dart';

class PhoneNumberEditByController extends GetxController {
  //보호자 인증 관련 컨트롤러
  RxBool _canInputVertifyNumber = false.obs;
  RxBool _canChange = false.obs;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  void sendVertifyNumber() async{
    //todo 변경
    // bool response = await PhoneEditApi().sendVerificationCode(_nameController.text, _phoneNumberController.text);
    // if(response){
    //   _canInputVertifyNumber.value = true;
    // }

    bool response = await PhoneEditApi().sendVerificationCode(_nameController.text, _phoneNumberController.text);
    if(!response){
      _canInputVertifyNumber.value = true;
    }
  }

  void checkCode()async{
    //todo 변경
    // bool response = await PhoneEditApi().checkVerificationCode(_verifyNumberController.text, _phoneNumberController.text);
    // if(response){
    //   _canChange.value = true;
    // }
    bool response = await PhoneEditApi().checkVerificationCode(_verifyNumberController.text, _phoneNumberController.text);
    if(!response){
      _canChange.value = true;
    }
  }


  bool get canChange => _canChange.value;

  bool get canInputVertifyNumber => _canInputVertifyNumber.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get verifyNumberController => _verifyNumberController;
}