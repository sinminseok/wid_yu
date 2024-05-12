

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/old/account/api/OldLoginApi.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

class OldLoginController extends GetxController{
  //TextEditingController codeController = TextEditingController();


  RxInt _canNextStep = 0.obs;

  void validateNextStep(){
    _canNextStep.value = -1;
  }

  void loginOld(String code)async{
    print(code);
    if(code.length != 7){

      ToastMessage().showtoast("올바르지 않은 코드입니다.");
    }else{
      var response = await OldLoginApi().loginOld(code);
      if(response){
        Get.offAll(() => OldFrameView(0));
      }

    }

  }

  int get canNextStep => _canNextStep.value;
}