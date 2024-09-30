

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/old/account/api/OldLoginApi.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

class OldLoginController extends GetxController{
  //TextEditingController codeController = TextEditingController();


  RxInt _canNextStep = 0.obs;

  void validateNextStep(){
    _canNextStep.value = -1;
  }

  void loginOld(String code, String fcmCode)async{
    if(code.length != 7){

      ToastMessage().showtoast("올바르지 않은 코드입니다.");
    }else{

      var response = await OldLoginApi().loginOld(code,fcmCode);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(response){
        prefs.setBool("auto_login_old", true);
        prefs.setString("login_key", code);
        Get.offAll(() => OldFrameView(0));
      }

    }

  }

  int get canNextStep => _canNextStep.value;
}