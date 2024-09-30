import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import 'package:wid_yu/young/goal/goal-edit/api/GoalEditApi.dart';
import 'package:wid_yu/young/goal/goal-edit/dto/GoalEditRequest.dart';
import 'package:wid_yu/young/goal/goal-edit/dto/GoalTimeEditRequest.dart';

import '../../../../final-dto/common-dto/request/goal/GoalGeneratorRequest.dart';
import '../../../../final-dto/common-dto/request/goal/GoalTimeGeneratorRequest.dart';
import '../../popup/SaveFinishPopup.dart';

class GoalEditController extends GetxController {
  // 선택된 사용자
  RxList<GoalTimeEditRequest> addTimes = <GoalTimeEditRequest>[].obs;
  late GoalResponse goalResponse;

  //목표 텍스트 컨트롤러
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  RxInt? titleTextLength = 0.obs;
  RxInt? contentTextLength = 0.obs;

  //복용시간 컨트롤러
  TextEditingController _drugDountController = TextEditingController();
  TextEditingController _hourController = TextEditingController(text: "1");
  TextEditingController _minuteController = TextEditingController(text: "1");

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

  GoalEditController(GoalResponse _currentGoal) {
    goalResponse = _currentGoal;
    initType(_currentGoal.type!);
    initDay(_currentGoal.day!);
    initTimes(_currentGoal.times!);
    _titleController.text = _currentGoal.title!;
    _contentController.text = _currentGoal.description!;
  }

  void initTimes(List<GoalTimeResponse> times) {
    for (int i = 0; i < times.length; i++) {
      GoalTimeEditRequest initTime = GoalTimeEditRequest(
          goalStatusIdx: times[i].goalStatusIdx!,
          time: times[i].time!,
          pullNum: times[i].pillNum);
      addTimes.add(initTime);
    }
  }

  void initType(String type) {
    if (type == "MEDICATION") {
      _drug.value = true;
    } else if (type == "WALKING") {
      _outing.value = true;
    } else {
      _common.value = true;
    }
  }

  void initDay(String day) {
    _monday.value = (day[1] == '1');
    _tuesday.value = (day[2] == '1');
    _wednesday.value = (day[3] == '1');
    _thursday.value = (day[4] == '1');
    _friday.value = (day[5] == '1');
    _saturday.value = (day[6] == '1');
    _sunday.value = (day[0] == '1');
  }

  void updateGoal(BuildContext context, bool isOld) async {
    //todo useridx 선택
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    GoalEditRequest goalEditRequest = GoalEditRequest(
        goalIdx: goalResponse.goalIdx,
        userIdx: goalResponse.userIdx,
        title: _titleController.text,
        description: _contentController.text,
        type: createGoalType().toString(),
        day: createDays(),
        goalStatusList: parseTime());

    bool response = await GoalEditApi().editGoalApi(goalEditRequest);

    if(response){
      SaveFinishPopup().showDialog(context, isOld);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('네트워크 오류'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: '확인',
          onPressed: () {},
        ),
      ));
    }
  }

  List<GoalTimeEditRequest> parseTime() {
    List<GoalTimeEditRequest> updatedTimes = addTimes.map((timeEditRequest) {
      // time 값이 "HH:mm" 형식인 경우 "HH:mm:00" 형식으로 변환
      if (timeEditRequest.time.length == 5) {
        timeEditRequest.time = "${timeEditRequest.time}:00";
      }
      return timeEditRequest;
    }).toList();

    return updatedTimes;
  }


  Future<bool> deleteGoal(int goalIdx) async {
    return await GoalEditApi().deleteGoalApi(goalIdx);
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

    // 오후 선택 시 시간을 조정
    if (_afternoon.value) {
      // 오후인 경우 시간을 12시간 더하여 변환
      var adjustedHour = (hour == 12) ? 12 : hour + 12;
      var missionTime = GoalTimeEditRequest(
          goalStatusIdx: null,
          time: '$adjustedHour:${_minuteController.text}:00',
          pullNum: _drugDountController.text == ""
              ? null
              : int.parse(_drugDountController.text));
      addTimes.add(missionTime);
    } else {
      // 오전인 경우 시간을 그대로 사용
      var missionTime = GoalTimeEditRequest(
          time:
              '${hour.toString().padLeft(2, '0')}:${_minuteController.text}:00',
          goalStatusIdx: null,
          pullNum: _drugDountController.text == ""
              ? null
              : int.parse(_drugDountController.text));
      addTimes.add(missionTime);
    }

    _drugDountController.text = "";
    _hourController.text = "1";
    _minuteController.text = "1";
    _isRightTime.value = 0;
    _morning.value = false;
    _afternoon.value = false;
  }

  // 추가된 복용 시간 삭제
  void deleteTime(GoalTimeEditRequest missionTime) {
    final List<GoalTimeEditRequest> updatedTimes = List.from(addTimes.value);
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
