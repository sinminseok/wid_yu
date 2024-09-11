import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/YoungMainGoalResponse.dart';
import 'package:wid_yu/young/goal/main/api/YoungGoalApi.dart';
import '../../../../common/view/popup/AlarmOnPopup.dart';

class YoungGoalController extends GetxController {
  // 나머지 코드는 그대로 유지됩니다.
  RxBool isLoading = true.obs;

  // 메인화면 전체 데이터
  late Rx<YoungMainGoalResponse> _totalInformation = initCurrent.obs;
  //본인의 오늘 목표
  List<GoalResponse> _todayMyGoal = [];

  //본인의 전체 목표
  List<GoalResponse> _totalMyGoal  = [];

  RxBool switchValue = false.obs;
  RxBool isBottomScroll = false.obs;
  RxBool canEdit = false.obs;

  ScrollController scrollController = ScrollController();

  Future<bool> loadInit()async {
    _totalInformation.value = (await YoungGoalApi().loadMainPage())!;
    if(_totalInformation.value.goalsAndStatus!.length != 0 && _totalInformation.value.goalsAndStatus![0].goalIdx != 0){
      filterTodayMyGoal(_totalInformation.value);
      filterTotalMyGoal(_totalInformation.value);
    }else{

    }
    return true;
  }

  void filterTodayMyGoal(YoungMainGoalResponse information) {
    // 현재 요일의 인덱스를 구합니다. (1=월요일, 7=일요일)
    int currentDayIndex = DateTime.now().weekday;

    // 일요일부터 시작하는 인덱스로 변환합니다.
    // 예: 월요일(1) -> 1, 화요일(2) -> 2, ..., 일요일(7) -> 0
    currentDayIndex = (currentDayIndex % 7);


    _todayMyGoal = information.goalsAndStatus!
        .where((goal) => goal.day![currentDayIndex] == '1')
        .toList();
  }


  void filterTotalMyGoal(YoungMainGoalResponse information){
    _totalMyGoal = information.goalsAndStatus!;
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

  YoungMainGoalResponse get totalInformation => _totalInformation.value;

  List<GoalResponse> get totalMyGoal => _totalMyGoal;

  List<GoalResponse> get todayMyGoal => _todayMyGoal;
}
