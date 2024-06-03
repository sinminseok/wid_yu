
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:wid_yu/common/dto/health/Health.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserResponse.dart';
import 'package:wid_yu/old/health-information/api/OldHealthApi.dart';
import 'package:wid_yu/old/health-information/dto/OldHealthResponse.dart';
import 'package:wid_yu/old/health-information/popup/HealthInformationPopup.dart';

import '../../../common/dto/user/OldUser.dart';
import '../../../final-dto/common-dto/response/user/UserType.dart';
import '../../../young/health-infroamtion/api/YoungHealthApi.dart';
import '../../../young/health-infroamtion/dto/HealthAllResponse.dart';

class OldHealthInformationController extends GetxController {

  OldHealthResponse? _healthResponse;

  Future<bool> loadInit(BuildContext context) async{
    _healthResponse = await OldHealthApi().loadMainPage();

    showDangerous(_healthResponse!.state, _healthResponse!.heartBit, _healthResponse!.userIdx, context);

    if(_healthResponse == null){
      return false;
    }
    return true;
  }

  void showDangerous(
      int state, double value, int userIdx, BuildContext context) async {
    HealthAllResponse? healthAllResponse =
    await OldHealthApi().loadDetailInformation(userIdx);

    if ((value <= 50 || value >= 130) && state == 1) {
      HealthInformationPopup().createGoalPopup(healthAllResponse!, context);
    }
  }

  OldHealthResponse get healthResponse => _healthResponse!;
}