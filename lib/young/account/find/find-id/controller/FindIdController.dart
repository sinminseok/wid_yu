

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/young/account/login/controller/YoungLoginController.dart';

import '../../../../../common/utils/SnackBar.dart';
import '../api/YoungIdFindApi.dart';
import '../dto/FindIdResponse.dart';
import '../view/FindIdSuccessView.dart';

class FindIdController extends GetxController{

  YoungIdFindApi api = YoungIdFindApi();

  RxBool _canInputVerifyNumber = false.obs;
  RxBool _isSendNumber = false.obs;
  RxInt _isSuccessFind = 0.obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  void findId()async{

    if(validateEmpty()) {
      FindIdResponseDto? response = await api.findId(_nameController.text, _phoneNumberController.text);
      if(response != null){
        Get.to(() => FindIdSuccessView(response));
        _isSuccessFind.value = 1;
      }else{
        _isSuccessFind.value = -1;
      }
    }
  }

  bool validateEmpty() {
    if(_nameController.text == "" || _phoneNumberController.text == ""){
      ToastMessage().showtoast("값을 모두 입력하세요.");
      return false;
    }
    return true;
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