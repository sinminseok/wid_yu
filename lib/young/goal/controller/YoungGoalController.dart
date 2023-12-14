import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/model/mission/Mission.dart';
import 'package:wid_yu/common/model/user/TestHealth.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';

import '../../../common/model/mission/MissionType.dart';
import '../../../common/view/popup/AlarmOnPopup.dart';

class YoungGoalController extends GetxController {
  Rx<TestUser> myUser = TestUser("보호자님", TestHealth(1,1,1), false).obs;
  RxList<TestUser> olds = <TestUser>[TestUser("부모님1", TestHealth(1,1,1), false),TestUser("부모님2", TestHealth(1,1,1), false)].obs;
  //RxList<TestUser> olds = <TestUser>[].obs;

  RxBool switchValue = false.obs;
  RxBool isBottomScroll = false.obs;
  RxBool canEdit = false.obs;

  ScrollController scrollController = ScrollController();

  List<Mission> myMission = [
    Mission("위염약", "~~복용하세요", MissionType.DRUG),
    Mission("런닝", "~~복용하세요", MissionType.WALK),
    Mission("독서", "~~복용하세요", MissionType.COMMON),
  ];

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
        print("das");
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
