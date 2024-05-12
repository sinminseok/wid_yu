import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/young/account/login/api/YoungLoginApi.dart';

import '../../../../common/api/AwsServices.dart';
import '../../../frame/YoungFrameView.dart';

class YoungLoginController extends GetxController {
  //자동로그인 체크 변수
  RxBool _isChecked = false.obs;
  RxBool _isWrongInformation = false.obs;
  RxBool _obscurePassword = true.obs;

  TextEditingController idController = TextEditingController();
  TextEditingController passworController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _isChecked.close();
    super.onClose();
  }

  // 부양자 로그인 메서드
  void login() async {
    if (idController.text == "" || passworController.text == "") {
      ToastMessage().showtoast("아이디와 비밀번호를 입력해주세요.");
    } else {
      String? _fcmToken = await FirebaseMessaging.instance.getToken();
      var response = await YoungLoginApi().loginYoung(_isChecked.value,
          idController.text, passworController.text, _fcmToken!);
      if (response == true) {
        if (_isChecked.value) {
          // 자동로그인 세팅
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool("auto_login", true);
          prefs.setString("login_id", idController.text);
          prefs.setString("login_pw", passworController.text);
        }
        Get.offAll(() => YoungFrameView(0), transition: Transition.fadeIn);
      } else {
        ToastMessage().showtoast("존재하지 않는 계정 입니다.");
      }
    }
  }


  void validateAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var bool = prefs.getBool("auto_login");
  }

  void changeObscurePassword() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void updateIsCheck(bool? value) {
    if (value != null) {
      _isChecked.value = value;
      print(_isChecked);
      update([_isChecked]);
    }
  }

  bool get isChecked => _isChecked.value;

  bool get isWrongInformation => _isWrongInformation.value;

  bool get obscurePassword => _obscurePassword.value;
}
