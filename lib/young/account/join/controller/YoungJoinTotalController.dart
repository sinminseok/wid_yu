import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../final-dto/common-dto/response/Disease.dart';
import '../../../../common/utils/PopUp.dart';
import '../../../../common/utils/exception/InvalidInformationException.dart';
import '../../../../final-dto/old-dto/request/OldDiseaseRequest.dart';
import '../../../../final-dto/old-dto/request/OldGeneratorRequest.dart';
import '../api/YoungJoinTotalApi.dart';
import '../finish/JoinSuccessOnlyYoungView.dart';
import '../old-information/dto/OldLoginDto.dart'; //f6b0414

class YoungJoinTotalController extends GetxController {
  YoungJoinTotalApi api = YoungJoinTotalApi();

  /**
   * 휴대폰 인증 페이지
   */
  RxBool _canInputVertifyNumber = false.obs;
  RxBool _isCheckAgree = false.obs;
  RxInt _isRightPhoneNumberFormat = 0.obs;
  RxBool _canNextStep = false.obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  // 휴대폰 인증 관련 메서드
  void sendVerificationNumber() async {
    if (_nameController.text == "" || !validateRightPhoneNumberFormat()) {
      ToastMessage().showtoast("정보를 올바르게 입력하세요.");
    } else {
      _canInputVertifyNumber.value = true;
      var response = await api.sendVerificationCode(
          _nameController.text, _phoneNumberController.text);

      if (response) {
        _canInputVertifyNumber.value = true;
      } else {
        ToastMessage().showtoast("정보를 다시 입력해주세요.");
      }
    }
  }

  // 인증번호 검증 메서드
  void checkNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // _canNextStep.value = true;
    //todo 아래로 변경
    if (_verifyNumberController.text.length != 4) {
      ToastMessage().showtoast("인증번호를 입력해주세요.");
    } else {
      //_canNextStep.value = true;
      var response = await api.checkVerificationCode(
          _verifyNumberController.text, _phoneNumberController.text);
      if (response) {
        _canNextStep.value = true;
        await prefs.setString("young_join_name", _nameController.text);
        await prefs.setString("young_join_phone_number", _phoneNumberController.text);
      } else {
        ToastMessage().showtoast("인증 번호가 다릅니다.");
      }
    }
  }

  // 이용약관 동의 메서드
  void checkAgree(bool value) {
    _isCheckAgree.value = value;
  }

  // 휴대폰 검증
  bool validateRightPhoneNumberFormat() {
    // 정규식을 사용하여 휴대폰 번호의 올바른 포맷인지 확인
    RegExp regex = RegExp(r'^010\s\d{4}\s\d{4}$');
    var hasMatch = regex.hasMatch(_phoneNumberController.text);

    if (hasMatch) {
      _isRightPhoneNumberFormat.value = 1;
    } else {
      _isRightPhoneNumberFormat.value = -1;
    }
    return hasMatch;
  }

  bool get agree => _isCheckAgree.value;

  int get isRightPhoneNumberFormat => _isRightPhoneNumberFormat.value;

  bool get canInputVertifyNumber => _canInputVertifyNumber.value;

  bool get isCheckAgree => _isCheckAgree.value;

  bool get canNextStep => _canNextStep.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get verifyNumberController => _verifyNumberController;

  /**
   * 부양자 아이디, 비번 페이지
   */
  RxBool _canSelectButton = false.obs;

  // 중복된아이다 == -1, 기본값 == 0, 검증 통과 ==1, 아이디 형식 안맞음 ==2
  RxInt _checkDuplicateId = 0.obs;
  RxString _passId = "".obs;

  //아이디 비번 컨트롤러
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //포맷 관련 필드 1일때 통과 -1일때 불 통과
  RxInt _isRightPhoneNumber = 0.obs;
  RxInt _isRightBrith = 0.obs;
  RxInt _isRightPassword = 0.obs;

  // 오직 내 계정만 생성 버튼
  void joinOnlyMyAccount() async {
    var response = await api.joinYoungAccount(
        passId.value,
        _passwordController.text,
        _nameController.text,
        _phoneNumberController.text);

    if (response == true) {
      Get.offAll(
          () => JoinSuccessOnlyYoungView(_nameController.text,
              _phoneNumberController.text, _idController.text),
          transition: Transition.fadeIn);
    } else {
      ToastMessage().showtoast("계정을 생성할 수 없습니다.");
    }
  }

  // 내 계정 생성 + 부모남 계정 생성 버튼
  Future<bool> joinAndOldAccount() async {
    var response = await api.joinYoungAccount(
        passId.value,
        _passwordController.text,
        _nameController.text,
        _phoneNumberController.text);

    return response;
  }



  void checkReTryId() {
    if (_passId.value != _idController.text) {
      _checkDuplicateId.value = 0;
    }
  }

  void disposeInAndPassword() {
    _idController.text = "";
    _passwordController.text = "";
    _checkDuplicateId.value = 0;
    _passId.value = "";
  }

  bool validateId() {
    String id = _idController.text;

    // 정규식을 사용하여 영문과 숫자를 조합한 6~12자 아이디인지 확인
    RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$');
    bool isValidId = regex.hasMatch(id);
    // 조건을 만족하면 _checkDuplicateId를 2로 설정, 그렇지 않으면 0으로 설정
    _checkDuplicateId.value = isValidId ? 0 : 2;
    return isValidId;
  }

  // 아이디 중복을 검증하는 메서드
  void checkDuplicateIdFunction() async {
    if (!validateId()) {
    } else {
      var response = await api.checkDuplicateId(_idController.text);
      if (response == true) {
        _checkDuplicateId.value = 1;
        _passId.value = _idController.text;
        checkCanSelectButton();
      } else {
        ToastMessage().showtoast("이미 존재하는 아이디 입니다.");
      }
    }
  }

  //아이디 비번 입력후 다음 단계로 넘어갈 수 있는지 확인하는 메서드
  void checkCanSelectButton() {
    _canSelectButton.value = _checkDuplicateId == 1 &&
        _idController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        validateRightPassword();
  }

  bool validateRightPassword() {
    String password = _passwordController.text;

    // 정규식을 사용하여 영문, 숫자, 특수 기호를 조합하고 길이가 8 이상 12 이하인지 확인
    RegExp regex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#%^&*()_+{}|;\":<>?/~`])[\s\S]{8,12}$');
    var hasMatch = regex.hasMatch(password);

    if (hasMatch == false) {
      _isRightPassword.value = -1;
    }
    if (hasMatch == true) {
      _isRightPassword.value = 1;
    }

    return hasMatch;
  }

  TextEditingController get idController => _idController;

  bool get canSelectButton => _canSelectButton.value;

  int get checkDuplicateId => _checkDuplicateId.value;

  RxString get passId => _passId;

  TextEditingController get passwordController => _passwordController;

  int get isRightPhoneNumber => _isRightPhoneNumber.value;

  int get isRightBrith => _isRightBrith.value;

  int get isRightPassword => _isRightPassword.value;

  /**
   * 시니어 회원가입
   */

  TextEditingController oldNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController oldPhoneNumberController = TextEditingController();
  Rx<String> _addressController = "".obs;

  TextEditingController diseaseNameController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController drugInformationController = TextEditingController();
  TextEditingController introduceController = TextEditingController();

  RxBool canOldNextStep = false.obs;
  RxInt? isDisease = 0.obs;
  RxInt? drugInformationTextLength = 0.obs;

  RxInt _isRightBirthFormat = 0.obs;
  RxInt _isRightOldPhoneNumberFormat = 0.obs;

  late RxList<Disease> diseases;

  final String INPUT_VALUE_EMPTY_ERROR = "모든 값들을 입력해주세요.";

  OldGeneratorRequest createOld() {
    OldDiseaseRequest oldDiseaseRequest = OldDiseaseRequest(
        diseaseNameController.text,
        drugNameController.text,
        drugInformationController.text);

    var oldGeneratorRequest = OldGeneratorRequest(
        name: oldNameController.text,
        birth: formatResidentNumber(ageController.text),
        phoneNumber: oldPhoneNumberController.text,
        address: addressController,
        isDisease: isDisease?.value,
        diseases: isDisease?.value == 1 ? [oldDiseaseRequest] : [],
        age: null);
    return oldGeneratorRequest;
  }

  Future<OldLoginDto?> joinOld(OldGeneratorRequest old) async {
    OldLoginDto? oldLoginDto = await api.createOldAccount(old);
    return oldLoginDto;
  }

  void updateNextStepState() {
    // 각 컨트롤러의 입력값이 비어있지 않으면 true로 설정합니다.
    if (isDisease == 1) {
      bool isAllFilled = _addressController != "" &&
          oldNameController.text.isNotEmpty &&
          ageController.text.isNotEmpty &&
          oldPhoneNumberController.text.isNotEmpty &&
          isDisease?.value != 0 &&
          drugNameController.text.isNotEmpty &&
          diseaseNameController.text.isNotEmpty;
      if (canOldNextStep.value != isAllFilled) {
        canOldNextStep.value = isAllFilled;
      }
      return;
    }
    bool isAllFilled = _addressController != "" &&
        oldNameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        oldPhoneNumberController.text.isNotEmpty &&
        isDisease?.value != -1;

    // 이전 상태와 현재 상태가 다르면 setState를 호출하여 UI를 업데이트합니다.
    if (canOldNextStep.value != isAllFilled) {
      canOldNextStep.value = isAllFilled;
    }
  }

  bool validateRightBirthFormat() {
    // 정규식을 사용하여 출생년도의 올바른 포맷인지 확인
    RegExp regex =
        RegExp(r'^\d{4}\.(0[1-9]|1[0-2])\.(0[1-9]|[12][0-9]|3[01])$');
    var hasMatch = regex.hasMatch(ageController.text);
    print(hasMatch);
    if (hasMatch) {
      _isRightBirthFormat.value = 1;
    }

    if (!hasMatch) {
      _isRightBirthFormat.value = -1;
    }

    return true;
  }

  bool validateRightPhoneNumerFormat() {
    // 정규식을 사용하여 휴대폰 번호의 올바른 포맷인지 확인
    RegExp regex = RegExp(r'^010\s\d{4}\s\d{4}$');
    var hasMatch = regex.hasMatch(oldPhoneNumberController.text);

    if (hasMatch) {
      _isRightOldPhoneNumberFormat.value = 1;
    } else {
      _isRightOldPhoneNumberFormat.value = -1;
    }

    return hasMatch;
  }

  void resetController() {
    _addressController.value = "";
    diseaseNameController.clear();
    drugNameController.clear();
    introduceController.clear();
  }

  String formatResidentNumber(String? residentNumber) {
    // 주민등록번호 앞자리에서 연, 월, 일을 추출합니다.
    String? year = residentNumber?.substring(0, 2);
    String? month = residentNumber?.substring(2, 4);
    String? day = residentNumber?.substring(4, 6);
    // "-"를 추가하여 문자열을 조합합니다.
    String formattedNumber = "$year-$month-$day";
    return formattedNumber;
  }

  void removeDisease(int index) {
    diseases.removeAt(index);
  }

  void haveDisease() {
    isDisease?.value = 1;
  }

  void haveNotDisease() {
    isDisease?.value = 0;
  }

  void checkDiseaseAnswer() {
    if (diseaseNameController.text.isEmpty) {
      throw InvalidInformationException("질병이름은 필수로 입력해주세요.");
    }
  }

  void addressAPI(BuildContext context) async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );

    String address =
        "${model.zonecode!} ${model.address!} ${model.buildingName!}";
    _addressController.value = address;
    updateNextStepState();
  }

  void onChangeDrugText() {
    drugInformationTextLength?.value = drugInformationController.text.length;
  }

  String get addressController => _addressController.value;

  int get isRightOldPhoneNumberFormat => _isRightOldPhoneNumberFormat.value;

  int get isRightBirthFormat => _isRightBirthFormat.value;
}
