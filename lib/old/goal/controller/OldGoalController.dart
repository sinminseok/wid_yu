
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';

import '../../../common/view/popup/AlarmOnPopup.dart';

class OldGoalController extends GetxController {
  RxBool _switchValue = false.obs;

  void checkAlarm(BuildContext context)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.get("alarmOn");
    if(key == null){
      AlarmOnPopup().showDialog(context);
    }
  }

  void updateSwitchValue(bool value){
    _switchValue.value = value;
  }

  bool get switchValue => _switchValue.value;
}