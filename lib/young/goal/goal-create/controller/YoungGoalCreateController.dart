
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';

import '../../../../common/dto/goal/GoalTimeStatus.dart';
import '../../../../common/dto/goal/GoalType.dart';

class YoungGoalCreateController {
  List<OldUser> users = [OldUser.empty(),OldUser.empty()];
  RxList<GoalTime> addTimes = <GoalTime>[].obs;

  late Rx<OldUser> selectUser = users[0].obs;

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

  Goal createGoal() {
    return Goal(_titleController.text, _contentController.text,
        createGoalType(), addTimes, createDays());
  }

  List<int> createDays() {
    return [1, 1, 0, 0, 0, 0, 0];
  }

  GoalType createGoalType(){
    if(_drug.value == true){
      return GoalType.DRUG;
    }
    if(_outing.value == true){
      return GoalType.WALK;
    }
    return GoalType.COMMON;
  }

  void validateCanSave(){
    if(isRightSelectMissionType() && isRightMissionForm() && isRightPickDay() && addTimes.value.length > 0){
      _canSaveMission.value = true;
    }else{
      _canSaveMission.value = false;
    }
  }

  bool isRightSelectMissionType(){
    return _drug.value == true || _common.value == true || _outing.value == true;
  }

  bool isRightMissionForm() {
    return _titleController.text.isNotEmpty && _contentController.text.isNotEmpty;
  }

  bool isRightPickDay() {
    return _monday.value == true || _tuesday.value == true || _wednesday.value == true || _thursday.value == true || _friday.value == true || _saturday.value == true || _sunday.value == true;
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

  void pickUser(int index){
    selectUser.value = users[index];
  }


  void validateTime(){
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
    var missionTime = GoalTime(
        _hourController.text + ":" + _minuteController.text,
        GoalTimeStatus.YET,
        0, []);
    addTimes.add(missionTime);

    _hourController.text = "1";
    _minuteController.text = "1";
    _isRightTime.value = 0;
    _morning.value = false;
    _afternoon.value = false;
  }

  void deleteTime(GoalTime missionTime) {
    // Create a new list excluding the specified missionTime
    final List<GoalTime> updatedTimes = List.from(addTimes.value);
    updatedTimes.remove(missionTime);

    // Assign the updated list to addTimes
    addTimes.value = updatedTimes;
  }

  bool canAddTime(){
    return _isRightTime.value == 1 && _drugDountController.text.isNotEmpty && (_afternoon.value == true || _morning.value == true);
  }

  void onChangeTitleText(){
    titleTextLength?.value = _titleController.text.length;
  }

  void onChangeContentText(){
    contentTextLength?.value = _contentController.text.length;
  }

  void selectDrugType(){
    _drug.value = true;
    _outing.value = false;
    _common.value = false;
  }

  void selectWalkType(){
    _drug.value = false;
    _outing.value = true;
    _common.value = false;
  }

  void selectCommonType(){
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

  void clickSwitch(bool value){
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