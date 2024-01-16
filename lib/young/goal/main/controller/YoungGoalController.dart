import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/common/dto/goal/GoalType.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';
import '../../../../common/view/popup/AlarmOnPopup.dart';

class YoungGoalController extends GetxController {
  Rx<YoungUser> myUser = YoungUser.empty().obs;
  RxList<OldUser> olds = <OldUser>[OldUser.empty(), OldUser.empty()].obs;

  RxBool switchValue = false.obs;
  RxBool isBottomScroll = false.obs;
  RxBool canEdit = false.obs;

  ScrollController scrollController = ScrollController();

  List<Goal> myMission = [
    Goal("미션","설명",GoalType.DRUG,[GoalTime("12:0", GoalTimeStatus.DONE, 1, [])],[1,2],),
    Goal("미션2","설명",GoalType.DRUG,[GoalTime("12:0", GoalTimeStatus.DONE, 1, [])],[1,2],),
  ];

  bool hasOld(){
    if(olds.length == 0){
      return false;
    }
    return true;
  }

  void updateCanEdit(){
    canEdit.value = !canEdit.value;
  }



  void checkAlarm(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.get("alarmOn");
    if (key == null) {
      AlarmOnPopup().showDialog(context);
    }
  }

  void controllScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // 스크롤이 끝까지 내려갔을 때
        isBottomScroll.value = true;
      } else if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        // 스크롤이 끝까지 올라갔을 때
        isBottomScroll.value = false;
      }
    });
  }

  void goDetailYoungMissions() {
    double desiredPosition = scrollController.position.maxScrollExtent + 400.h;

    isBottomScroll.value = true;
    scrollController.animateTo(
      desiredPosition,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void updateSwitchValue(bool value) {
    switchValue.value = value;
  }


}
