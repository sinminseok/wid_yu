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
  RxBool? isDisease = false.obs;

  late RxList<Disease> diseases;

  final String INPUT_VALUE_EMPTY_ERROR = "모든 값들을 입력해주세요.";


  void updateNextStepState() {
    // 각 컨트롤러의 입력값이 비어있지 않으면 true로 설정합니다.
    bool isAllFilled = nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty;
    print(isAllFilled);

    // 이전 상태와 현재 상태가 다르면 setState를 호출하여 UI를 업데이트합니다.
    if (canNextStep.value != isAllFilled) {
      canNextStep.value = isAllFilled;
    }
  }

  void resetController() {
    diseaseNameController.clear();
    drugNameController.clear();
    introduceController.clear();
  }

  Old createSenior() {
    return Old(nameController.text, int.parse(ageController.text),
        int.parse(phoneNumberController.text), addressController.text, false);
  }

  void removeDisease(int index) {
    diseases.removeAt(index);
  }

  void haveDisease() {
    isDisease?.value = true;
  }

  void haveNotDisease() {
    isDisease?.value = false;
  }

  void checkDiseaseAnswer() {
    if (diseaseNameController.text.isEmpty) {
      throw InvalidInformationException("질병이름은 필수로 입력해주세요.");
    }
  }
}
