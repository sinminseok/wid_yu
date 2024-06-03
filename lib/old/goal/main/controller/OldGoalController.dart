import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/dto/young-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/final-dto/old-dto/response/user/OldMainGoalResponse.dart';
import 'package:wid_yu/old/goal/main/api/OldGoalMainApi.dart';

import '../../../../common/dto/goal/GoalType.dart';
import '../../../../common/view/popup/AlarmOnPopup.dart';
import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';

class OldGoalController extends GetxController {
  OldMainGoalResponse? _user = null;
  List<GoalResponse>? _todayGoals = [];
  List<GoalResponse>? _totalGoals = [];

  RxBool _switchValue = false.obs;

  // List<GoalResponse> myMission = [
  //   GoalResponse(goalIdx: 1,title: "타으틸", description: "ahrcy", type: GoalType.MEDICATION.toString(), day: "1100001", times: []),
  //   GoalResponse(goalIdx: 1,  title: "타으틸", description: "ahrcy", type: GoalType.MEDICATION.toString(), day: "1100001", times: []),
  //
  // ];

  Future<bool> loadInit() async {
    _user = await OldGoalMainApi().loadMainPage();
    filterTodayMyGoal(_user!);
    _totalGoals = _user?.goalsAndStatus;
    //_todayGoals = _user?.goalsAndStatus;
    if (_user != null) {
      return true;
    }
    return false;
  }

  void filterTodayMyGoal(OldMainGoalResponse information) {
    // 현재 요일의 인덱스를 구합니다. (1=월요일, 7=일요일)
    int currentDayIndex = DateTime.now().weekday;

    // 일요일부터 시작하는 인덱스로 변환합니다.
    // 예: 월요일(1) -> 1, 화요일(2) -> 2, ..., 일요일(7) -> 0
    currentDayIndex = (currentDayIndex % 7);


    if(information.goalsAndStatus![0].day != null){
      _todayGoals = information.goalsAndStatus!
          .where((goal) => goal.day![currentDayIndex] == '1')
          .toList();
    }

  }

  void checkAlarm(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.get("alarmOn");
    if (key == null) {
      AlarmOnPopup().showDialog(context);
    }
  }

  void updateSwitchValue(bool value) {
    _switchValue.value = value;
  }

  OldMainGoalResponse? get user => _user;

  List<GoalResponse>? get todayGoals => _todayGoals;

  bool get switchValue => _switchValue.value;

  List<GoalResponse>? get totalGoals => _totalGoals;
}
