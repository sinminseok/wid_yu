
import 'package:get/get.dart';

class GoalEditController extends GetxController{
  RxBool _drug = false.obs;
  RxBool _outing = false.obs;
  RxBool _common = false.obs;

  RxBool _monday = false.obs;
  RxBool _tuesday = false.obs;
  RxBool _wednesday = false.obs;
  RxBool _thursday = false.obs;
  RxBool _friday = false.obs;
  RxBool _saturday = false.obs;
  RxBool _sunday = false.obs;

  RxBool _morning = false.obs;
  RxBool _afternoon = false.obs;



  RxBool _switchValue = false.obs;


  void selectDrug(){
    _drug.value = true;
    _outing.value = false;
    _common.value = false;
  }

  void selectOuting(){
    _drug.value = false;
    _outing.value = true;
    _common.value = false;
  }

  void selectCommon(){
    _drug.value = false;
    _outing.value = false;
    _common.value = true;
  }

  void selectMondayTerm(){
    _monday.value = !_monday.value;
  }

  void selectTuesdayTerm(){
    _tuesday.value = !_tuesday.value;
  }

  void selectWednesdayTerm(){
    _wednesday.value = !_wednesday.value;
  }

  void selectThursdayTerm(){
    _thursday.value = !_thursday.value;
  }

  void selectFridayTerm(){
    _friday.value = !_friday.value;
  }

  void selectSaturdayTerm(){
    _saturday.value = !_saturday.value;
  }

  void selectSundayTerm(){
    _sunday.value = !_sunday.value;
  }

  void selectMorning(){
    _morning.value = true;
    _afternoon.value = false;
  }

  void selectAfternoon(){
    _morning.value = false;
    _afternoon.value = true;
  }



  // TextEditingController get contentController => _contentController;
  //
  // TextEditingController get titleController => _titleController;

  bool get switchValue => _switchValue.value;

  bool get afternoon => _afternoon.value;

  bool get morning => _morning.value;

  bool get sunday => _sunday.value;

  bool get saturday => _saturday.value;

  bool get friday => _friday.value;

  bool get thursday => _thursday.value;

  bool get wednesday => _wednesday.value;

  bool get tuesday => _tuesday.value;

  bool get monday => _monday.value;

  bool get common => _common.value;

  bool get outing => _outing.value;

  bool get drug => _drug.value;

}