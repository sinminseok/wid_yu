import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserProfileResponse.dart';
import 'package:wid_yu/young/goal/goal-create/api/YoungGoalCreateApi.dart';
import 'package:wid_yu/young/goal/goal-create/dto/UserSelectResponse.dart';
import 'package:wid_yu/young/goal/main/api/YoungGoalApi.dart';

import '../../../../dto/young-dto/request/goal/GoalStatusRequest.dart';
import '../../../../final-dto/common-dto/request/goal/GoalGeneratorRequest.dart';
import '../../../../final-dto/common-dto/request/goal/GoalTimeGeneratorRequest.dart';
import '../popup/YoungGoalPopup.dart';

class YoungGoalCreateController {
  YoungGoalCreateApi api = YoungGoalCreateApi();

  // 사용자 목록
  List<UserSelectResponse> users = [];
  // 선택된 사용자
  RxList<GoalTimeGeneratorRequest> addTimes = <GoalTimeGeneratorRequest>[].obs;

  late Rx<UserSelectResponse> selectUser = users[0].obs;

  //카테코리 선택
  RxBool _drug = false.obs;
  RxBool _outing = false.obs;
  RxBool _common = false.obs;

  //복용주기 선택
  RxBool _monday = false.obs;
  RxBool _tuesday = false.obs;
  RxBool _wednesday = false.obs;
  RxBool _thursday = false.obs;
  RxBool _friday = false.obs;
  RxBool _saturday = false.obs;
  RxBool _sunday = false.obs;

  //복용 시간 오전, 오후 선택
  RxBool _morning = false.obs;
  RxBool _afternoon = false.obs;

  //기본==0, 통과==1, 통과x == -1
  RxInt _isRightTime = 0.obs;

  RxBool _switchValue = false.obs;

  RxBool _canSaveMission = false.obs;

  Future<bool> loadAllUser() async {
    users = (await api.loadAllUsers())!;

    return true;
  }

  void createGoal(BuildContext context) async{
    //todo useridx 선택
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    GoalGeneratorRequest goalGeneratorRequest = GoalGeneratorRequest(
        userIdx: selectUser.value.userIdx,
        title: _titleController.text,
        //todo _contentController.text,
        description: _contentController.text,
        type: createGoalType().toString(),
        day: createDays(),
        goalStatusList: addTimes.value);


    var createGoalApi =await YoungGoalCreateApi().createGoalApi(goalGeneratorRequest);

    if(createGoalApi == true) {
      YoungGoalPopup().createGoalPopup(context);
    }else{
      ToastMessage().showtoast("네트워크 오류");
    }



  }

  String createDays() {
    String result = '';

    result += _sunday.value ? '1' : '0';
    result += _monday.value ? '1' : '0';
    result += _tuesday.value ? '1' : '0';
    result += _wednesday.value ? '1' : '0';
    result += _thursday.value ? '1' : '0';
    result += _friday.value ? '1' : '0';
    result += _saturday.value ? '1' : '0';

    return result;
  }

  String createGoalType() {
    if (_drug.value == true) {
      return "MEDICATION";
    }
    if (_outing.value == true) {
      return "WALKING";
    }
    return "GENERAL";
  }

  void validateCanSave() {
    if (isRightSelectMissionType() &&
        isRightMissionForm() &&
        isRightPickDay() &&
        addTimes.value.length > 0) {
      _canSaveMission.value = true;
    } else {
      _canSaveMission.value = false;
    }
  }

  bool isRightSelectMissionType() {
    return _drug.value == true ||
        _common.value == true ||
        _outing.value == true;
  }

  bool isRightMissionForm() {
    return _titleController.text.isNotEmpty &&
        _contentController.text.isNotEmpty;
  }

  bool isRightPickDay() {
    return _monday.value == true ||
        _tuesday.value == true ||
        _wednesday.value == true ||
        _thursday.value == true ||
        _friday.value == true ||
        _saturday.value == true ||
        _sunday.value == true;
  }

  //목표 텍스트 컨트롤러
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  RxInt? titleTextLength = 0.obs;
  RxInt? contentTextLength = 0.obs;

  //복용시간 컨트롤러
  TextEditingController _drugDountController = TextEditingController();
  TextEditingController _hourController = TextEditingController(text: "1");
  TextEditingController _minuteController = TextEditingController(text: "1");

  void pickUser(int index) {
    selectUser.value = users[index];
  }

  void validateTime() {
    final int hour = int.tryParse(_hourController.text) ?? 0;
    final int minute = int.tryParse(_minuteController.text) ?? 0;

    // Regular expressions to check if the values are within the desired ranges
    final RegExp hourRegex = RegExp(r'^(0?[1-9]|1[0-2])$');
    final RegExp minuteRegex = RegExp(r'^([0-5]?[0-9])$');

    final bool isHourValid = hourRegex.hasMatch(hour.toString());
    final bool isMinuteValid = minuteRegex.hasMatch(minute.toString());

    if (isHourValid && isMinuteValid) {
      // Time is valid, set _isRightTime to 1
      _isRightTime.value = 1;
    } else {
      // Time is not valid, set _isRightTime to -1
      _isRightTime.value = -1;
    }
  }

  void addTime() {
    final int hour = int.parse(_hourController.text);
    final int minute = int.parse(_minuteController.text);

    // Format the minute to ensure it has two digits
    String formattedMinute = minute.toString().padLeft(2, '0');

    // Adjust hour for PM
    if (_afternoon.value) {
      var adjustedHour = (hour == 12) ? 12 : hour + 12;
      var missionTime = GoalTimeGeneratorRequest(
        '$adjustedHour:$formattedMinute:00',
        _drugDountController.text.isEmpty ? null : int.parse(_drugDountController.text),
      );
      addTimes.add(missionTime);
    } else {
      var missionTime = GoalTimeGeneratorRequest(
        '${hour.toString().padLeft(2, '0')}:$formattedMinute:00',
        _drugDountController.text.isEmpty ? null : int.parse(_drugDountController.text),
      );
      addTimes.add(missionTime);
    }

    // Reset controllers
    _drugDountController.text = "";
    _hourController.text = "1";
    _minuteController.text = "1";
    _isRightTime.value = 0;
    _morning.value = false;
    _afternoon.value = false;
  }



  // 추가된 복용 시간 삭제
  void deleteTime(GoalTimeGeneratorRequest missionTime) {
    final List<GoalTimeGeneratorRequest> updatedTimes =
        List.from(addTimes.value);
    updatedTimes.remove(missionTime);
    addTimes.value = updatedTimes;
  }

  // 복용 시간 추가 가능 여부 검증
  bool canAddTime() {
    return _isRightTime.value == 1 &&
        (_afternoon.value == true || _morning.value == true);
  }

  void onChangeTitleText() {
    titleTextLength?.value = _titleController.text.length;
  }

  void onChangeContentText() {
    contentTextLength?.value = _contentController.text.length;
  }

  void selectDrugType() {
    _drug.value = true;
    _outing.value = false;
    _common.value = false;
  }

  void selectWalkType() {
    _drug.value = false;
    _outing.value = true;
    _common.value = false;
  }

  void selectCommonType() {
    _drug.value = false;
    _outing.value = false;
    _common.value = true;
  }

  void selectMonday() {
    _monday.value = !_monday.value;
  }

  void selectTuesday() {
    _tuesday.value = !_tuesday.value;
  }

  void selectWednesday() {
    _wednesday.value = !_wednesday.value;
  }

  void selectThursday() {
    _thursday.value = !_thursday.value;
  }

  void selectFriday() {
    _friday.value = !_friday.value;
  }

  void selectSaturday() {
    _saturday.value = !_saturday.value;
  }

  void selectSunday() {
    _sunday.value = !_sunday.value;
  }

  void selectMorning() {
    _morning.value = true;
    _afternoon.value = false;
  }

  void selectAfternoon() {
    _morning.value = false;
    _afternoon.value = true;
  }

  void clickSwitch(bool value) {
    _switchValue.value = value;
  }

  int get isRightTime => _isRightTime.value;

  bool get drug => _drug.value;

  bool get outing => _outing.value;

  bool get common => _common.value;

  bool get monday => _monday.value;

  bool get tuesday => _tuesday.value;

  bool get wednesday => _wednesday.value;

  bool get thursday => _thursday.value;

  bool get friday => _friday.value;

  bool get saturday => _saturday.value;

  bool get sunday => _sunday.value;

  bool get morning => _morning.value;

  bool get afternoon => _afternoon.value;

  bool get switchValue => _switchValue.value;

  TextEditingController get titleController => _titleController;

  TextEditingController get contentController => _contentController;

  TextEditingController get drugDountController => _drugDountController;

  TextEditingController get hourController => _hourController;

  TextEditingController get minuteController => _minuteController;

  bool get canSaveMission => _canSaveMission.value;
}
