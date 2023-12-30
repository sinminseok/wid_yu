
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class YoungJoinController extends GetxController {

  RxString _youngName = "".obs;
  RxString _youngPhoneNumber = "".obs;


  void saveNameAndPhoneNumber(String name, String phoneNumber){
    this._youngName.value = name;
    this._youngPhoneNumber.value = phoneNumber;
  }



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


  void checkReTryId(){
    if(_passId.value != _idController.text){
      _checkDuplicateId.value = 0;
    }
  }

  void disposeInAndPassword(){
    _idController.text = "";
    _passwordController.text = "";
    _checkDuplicateId.value = 0;
    _passId.value = "";
  }

  bool validateId(){
    String id = _idController.text;

    // 정규식을 사용하여 영문과 숫자를 조합한 6~12자 아이디인지 확인
    RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$');
    bool isValidId = regex.hasMatch(id);
    // 조건을 만족하면 _checkDuplicateId를 2로 설정, 그렇지 않으면 0으로 설정
    _checkDuplicateId.value = isValidId ? 0 : 2;
    return isValidId;
  }


  // 아이디 중복을 검증하는 메서드
  void checkDuplicateIdFunction(){
    if(validateId()){
      _checkDuplicateId.value = 1;
      _passId.value = _idController.text;
    }
    checkCanSelectButton();
  }

  //아이디 비번 입력후 다음 단계로 넘어갈 수 있는지 확인하는 메서드
  void checkCanSelectButton(){
     _canSelectButton.value =
         _checkDuplicateId == 1 &&_idController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty && validateRightPassword();
  }

  bool validateRightPassword() {
    String password = _passwordController.text;

    // 정규식을 사용하여 영문, 숫자, 특수 기호를 조합하고 길이가 8 이상 12 이하인지 확인
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#%^&*()_+{}|;\":<>?/~`])[\s\S]{8,12}$');
    var hasMatch = regex.hasMatch(password);

    if(hasMatch == false){
      _isRightPassword.value = -1;
    }
    if(hasMatch == true){
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
}