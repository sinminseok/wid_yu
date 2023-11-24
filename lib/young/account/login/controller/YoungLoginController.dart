import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../common/model/account/AwsServices.dart';

class YoungLoginController extends GetxController {
  RxBool isChecked = false.obs;
  bool isWrongInformation = false;
  bool obscurePassword = true;
  TextEditingController idController = TextEditingController();
  TextEditingController passworController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    isChecked.close();
    super.onClose();
  }


  login(String email, String password) => AwsServices().login(email, password);

  void validateInforamtion() {
    isWrongInformation = !isWrongInformation;
  }

  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
  }

  void updateIsCheck(bool? value) {
    if (value != null) {
      isChecked.value = value;
      update();
    }
  }

  void test() {
    print(idController.text);
  }
}
