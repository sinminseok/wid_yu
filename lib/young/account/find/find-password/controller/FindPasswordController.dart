
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/account/find/find-id/api/YoungIdFindApi.dart';
import 'package:wid_yu/young/account/find/find-password/view/FindPasswordSuccessView.dart';

class FindPasswordController extends GetxController{
  RxInt _isSuccessFind = 0.obs;
  RxBool _isSendNumber = false.obs;
  RxBool _isVertify = false.obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async{
    if(validate()){
      bool? response = await YoungIdFindApi().resetPassword(_nameController.text, _phoneNumberController.text, _idController.text, _newPasswordController.text);
      if(response!){
        Get.to(() => FindPasswordSuccessView(_nameController.text, _phoneNumberController.text, _idController.text, _newPasswordController.text));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('올바른 회원 정보가 아닙니다.'),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: '확인',
            onPressed: () {},
          ),
        ));
      }


    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('정보를 올바르게 입력하세요.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: '확인',
          onPressed: () {},
        ),
      ));
    }

  }

  bool validate(){
    if(_nameController.text == "" || _idController.text =="" || _phoneNumberController.text ==""|| _newPasswordController.text ==""){
      return false;
    }
    return true;
  }

  void sendNumber(){
    _isSendNumber.value = true;
  }

  void successVertify(){

    _isVertify.value = true;
  }


  bool get isVertify => _isVertify.value;


  TextEditingController get idController => _idController;

  bool get isSendNumber => _isSendNumber.value;

  int get isSuccessFind => _isSuccessFind.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get verifyNumberController => _verifyNumberController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get newPasswordController => _newPasswordController;
}