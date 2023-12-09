import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../common/model/account/AwsServices.dart';

class YoungLoginController extends GetxController {
  RxBool _isChecked = false.obs;
  RxBool _isWrongInformation = false.obs;
  RxBool _obscurePassword = false.obs;


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


  login(String email, String password) => AwsServices().login(email, password);

  void validateInforamtion() {
    _isWrongInformation.value = !_isWrongInformation.value;
  }

  void changeObscurePassword() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void updateIsCheck(bool? value) {
    if (value != null) {
      _isChecked.value = value;
      update();
    }
  }


  bool get isChecked => _isChecked.value;

  void test() {
    print(idController.text);
  }

  bool get isWrongInformation => _isWrongInformation.value;

  bool get obscurePassword => _obscurePassword.value;
}
