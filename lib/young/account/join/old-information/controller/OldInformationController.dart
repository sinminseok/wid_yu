import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/model/disease/Disease.dart';
import '../../../../../common/model/user/Old.dart';
import '../../../../../common/utils/exception/InvalidInformationException.dart';

class OldInformationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController diseaseNameController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController drugInformationController = TextEditingController();
  TextEditingController introduceController = TextEditingController();

  RxBool canNextStep = false.obs;
  RxInt? isDisease = 0.obs;
  RxInt? drugInformationTextLength = 0.obs;

  RxInt _isRightBirthFormat = 0.obs;
  RxInt _isRightPhoneNumberFormat = 0.obs;

  late RxList<Disease> diseases;

  final String INPUT_VALUE_EMPTY_ERROR = "모든 값들을 입력해주세요.";


  void updateNextStepState() {
    // 각 컨트롤러의 입력값이 비어있지 않으면 true로 설정합니다.
    if(isDisease == 1){
      bool isAllFilled = nameController.text.isNotEmpty &&
          ageController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty && isDisease?.value != 0 && drugNameController.text.isNotEmpty && diseaseNameController.text.isNotEmpty;
      if (canNextStep.value != isAllFilled) {
        canNextStep.value = isAllFilled;
      }
      return;
    }
    bool isAllFilled = nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty && isDisease?.value != 0;

    // 이전 상태와 현재 상태가 다르면 setState를 호출하여 UI를 업데이트합니다.
    if (canNextStep.value != isAllFilled) {
      canNextStep.value = isAllFilled;
    }
  }

  bool validateRightBirthFormat() {
    // 정규식을 사용하여 출생년도의 올바른 포맷인지 확인
    RegExp regex = RegExp(r'^\d{4}\.(0[1-9]|1[0-2])\.(0[1-9]|[12][0-9]|3[01])$');
    var hasMatch = regex.hasMatch(ageController.text);
    print(hasMatch);
    if(hasMatch){
      _isRightBirthFormat.value = 1;
    }

    if(!hasMatch){
      _isRightBirthFormat.value = -1;
    }

    return true;
  }

  bool validateRightPhoneNumerFormat() {
    // 정규식을 사용하여 휴대폰 번호의 올바른 포맷인지 확인
    RegExp regex = RegExp(r'^010\s\d{4}\s\d{4}$');
    var hasMatch = regex.hasMatch(phoneNumberController.text);

    if(hasMatch){
      _isRightPhoneNumberFormat.value = 1;
    } else {
      _isRightPhoneNumberFormat.value = -1;
    }

    return hasMatch;
  }


  void resetController() {
    diseaseNameController.clear();
    drugNameController.clear();
    introduceController.clear();
  }

  Old createSenior() {
    return Old(nameController.text, ageController.text,
        phoneNumberController.text, addressController.text, false);
  }

  void removeDisease(int index) {
    diseases.removeAt(index);
  }

  void haveDisease() {
    isDisease?.value = 1;
  }

  void haveNotDisease() {
    isDisease?.value = -1;
  }

  void checkDiseaseAnswer() {
    if (diseaseNameController.text.isEmpty) {
      throw InvalidInformationException("질병이름은 필수로 입력해주세요.");
    }
  }

  void onChangeDrugText(){
    drugInformationTextLength?.value = drugInformationController.text.length;
  }

  int get isRightPhoneNumberFormat => _isRightPhoneNumberFormat.value;

  int get isRightBirthFormat => _isRightBirthFormat.value;
}
