import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';

import '../../../../common/dto/goal/GoalType.dart';
import '../../../../common/view/popup/AlarmOnPopup.dart';

class OldGoalController extends GetxController {

  List<Goal> myMission = [
    Goal("위염약", "~~복용하세요", GoalType.DRUG,[],[]),
    Goal("런닝", "~~복용하세요", GoalType.WALK,[],[]),
    Goal("독서", "~~복용하세요", GoalType.COMMON,[],[]),
  ];


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
