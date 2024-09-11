import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/health-infroamtion/api/YoungHealthApi.dart';
import 'package:wid_yu/young/health-infroamtion/dto/HealthAllResponse.dart';

import '../../../../old/health-information/dto/OldHealthResponse.dart';
import '../../../../old/health-information/popup/HealthInformationPopup.dart';

class YoungHealthInformationController extends GetxController {
  List<OldHealthResponse> users = [];

  Rx<OldHealthResponse?> _currentUser = Rx<OldHealthResponse?>(null);

  void pickUser(int index) {
    _currentUser.value = users[index];
    update();
  }

  Future<bool> loadInit(BuildContext context) async {
    users = (await YoungHealthApi().loadMainPage())!;
    _currentUser.value = users[0];
    update();

    for (int i = 0; i < users.length; i++) {
      showDangerous(
          users[i].state, users[i].heartBit, users[i].userIdx, context);
    }

    return true;
  }

  void showDangerous(
      int state, double value, int userIdx, BuildContext context) async {
    HealthAllResponse? healthAllResponse =
        await YoungHealthApi().loadDetailInformation(userIdx);

    if ((value <= 50 || value >= 130) && state == 1) {
      HealthInformationPopup().createGoalPopup(healthAllResponse!, context);
    }
  }

  double? getUserO2() {
    return 1;
  }

  double? getUserTemperature() {
    return 1;
  }

  double? getUserHeartBit() {
    return 1;
  }

  OldHealthResponse? get currentUser => _currentUser.value;
}
