// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:remedi_kopo/remedi_kopo.dart';
// import 'package:wid_yu/common/dto/user/OldUser.dart';
// import 'package:wid_yu/dto/old-dto/request/OldDiseaseRequest.dart';
// import 'package:wid_yu/dto/young-dto/request/account/RequestOldInformationDto.dart';
//
// import '../../../../../common/dto/disease/Disease.dart';
// import '../../../../../common/dto/health/Health.dart';
// import '../../../../../common/utils/exception/InvalidInformationException.dart';
// import '../../../../../dto/old-dto/request/OldGeneratorRequest.dart';
//
// class OldInformationController extends GetxController {
//   TextEditingController oldNameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController oldPhoneNumberController = TextEditingController();
//   Rx<String> _addressController = "".obs;
//
//   TextEditingController diseaseNameController = TextEditingController();
//   TextEditingController drugNameController = TextEditingController();
//   TextEditingController drugInformationController = TextEditingController();
//   TextEditingController introduceController = TextEditingController();
//
//   RxBool canOldNextStep = false.obs;
//   RxInt? isDisease = 0.obs;
//   RxInt? drugInformationTextLength = 0.obs;
//
//   RxInt _isRightBirthFormat = 0.obs;
//   RxInt _isRightOldPhoneNumberFormat = 0.obs;
//
//   late RxList<Disease> diseases;
//
//   final String INPUT_VALUE_EMPTY_ERROR = "모든 값들을 입력해주세요.";
//
//   OldGeneratorRequest createOld() {
//     OldDiseaseRequest oldDiseaseRequest = OldDiseaseRequest(
//         diseaseNameController.text,
//         drugNameController.text,
//         drugInformationController.text);
//
//     var oldGeneratorRequest = OldGeneratorRequest(
//         name: oldNameController.text,
//         birth: formatResidentNumber(ageController.text),
//         phoneNumber: oldPhoneNumberController.text,
//         address: addressController,
//         isDisease: isDisease?.value,
//         diseases: isDisease?.value == 1 ? [oldDiseaseRequest] : [],
//         age: null);
//     return oldGeneratorRequest;
//   }
//
//
//
//   void updateNextStepState() {
//     // 각 컨트롤러의 입력값이 비어있지 않으면 true로 설정합니다.
//     if (isDisease == 1) {
//       bool isAllFilled = _addressController != "" &&
//           oldNameController.text.isNotEmpty &&
//           ageController.text.isNotEmpty &&
//           oldPhoneNumberController.text.isNotEmpty &&
//           isDisease?.value != 0 &&
//           drugNameController.text.isNotEmpty &&
//           diseaseNameController.text.isNotEmpty;
//       if (canOldNextStep.value != isAllFilled) {
//         canOldNextStep.value = isAllFilled;
//       }
//       return;
//     }
//     bool isAllFilled = _addressController != "" &&
//         oldNameController.text.isNotEmpty &&
//         ageController.text.isNotEmpty &&
//         oldPhoneNumberController.text.isNotEmpty &&
//         isDisease?.value != -1;
//
//     // 이전 상태와 현재 상태가 다르면 setState를 호출하여 UI를 업데이트합니다.
//     if (canOldNextStep.value != isAllFilled) {
//       canOldNextStep.value = isAllFilled;
//     }
//   }
//
//   bool validateRightBirthFormat() {
//     // 정규식을 사용하여 출생년도의 올바른 포맷인지 확인
//     RegExp regex =
//         RegExp(r'^\d{4}\.(0[1-9]|1[0-2])\.(0[1-9]|[12][0-9]|3[01])$');
//     var hasMatch = regex.hasMatch(ageController.text);
//     print(hasMatch);
//     if (hasMatch) {
//       _isRightBirthFormat.value = 1;
//     }
//
//     if (!hasMatch) {
//       _isRightBirthFormat.value = -1;
//     }
//
//     return true;
//   }
//
//   bool validateRightPhoneNumerFormat() {
//     // 정규식을 사용하여 휴대폰 번호의 올바른 포맷인지 확인
//     RegExp regex = RegExp(r'^010\s\d{4}\s\d{4}$');
//     var hasMatch = regex.hasMatch(oldPhoneNumberController.text);
//
//     if (hasMatch) {
//       _isRightOldPhoneNumberFormat.value = 1;
//     } else {
//       _isRightOldPhoneNumberFormat.value = -1;
//     }
//
//     return hasMatch;
//   }
//
//   void resetController() {
//     _addressController.value = "";
//     diseaseNameController.clear();
//     drugNameController.clear();
//     introduceController.clear();
//   }
//
//   String formatResidentNumber(String? residentNumber) {
//     // 주민등록번호 앞자리에서 연, 월, 일을 추출합니다.
//     String? year = residentNumber?.substring(0, 2);
//     String? month = residentNumber?.substring(2, 4);
//     String? day = residentNumber?.substring(4, 6);
//     // "-"를 추가하여 문자열을 조합합니다.
//     String formattedNumber = "$year-$month-$day";
//     return formattedNumber;
//   }
//
//   void removeDisease(int index) {
//     diseases.removeAt(index);
//   }
//
//   void haveDisease() {
//     isDisease?.value = 1;
//   }
//
//   void haveNotDisease() {
//     isDisease?.value = 0;
//   }
//
//   void checkDiseaseAnswer() {
//     if (diseaseNameController.text.isEmpty) {
//       throw InvalidInformationException("질병이름은 필수로 입력해주세요.");
//     }
//   }
//
//   void addressAPI(BuildContext context) async {
//     KopoModel model = await Navigator.push(
//       context,
//       CupertinoPageRoute(
//         builder: (context) => RemediKopo(),
//       ),
//     );
//
//     String address =
//         "${model.zonecode!} ${model.address!} ${model.buildingName!}";
//     _addressController.value = address;
//     updateNextStepState();
//   }
//
//   void onChangeDrugText() {
//     drugInformationTextLength?.value = drugInformationController.text.length;
//   }
//
//   String get addressController => _addressController.value;
//
//   int get isRightPhoneNumberFormat => _isRightOldPhoneNumberFormat.value;
//
//   int get isRightBirthFormat => _isRightBirthFormat.value;
// }
