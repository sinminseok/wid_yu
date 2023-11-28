
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/model/account/AwsServices.dart';
import '../../../../../common/utils/exception/InvalidInformationException.dart';
import '../../../../utils/RegConstants.dart';

class JoinIdPasswordController extends GetxController{
  static String INPUT_EMPTY_ERROR_MESSAGE = "모든 값을 입력해주세요.";
  static String INPUT_ID_ERROR_MESSAGE = "아이디는 이메일 형식으로 입력해주세요.";
  static String INPUT_PASSWORD_ERROR_MESSAGE =
      "비밀번호는 대,소문자와 특수문자를 포함한 8자리로 만들어야 합니다.";

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void validateInformation(String email, String password) {
    validateEmpty(email, password);
    validateEmail(email);
    // validatePassword(password);
  }

  void validateEmpty(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      throw InvalidInformationException(INPUT_EMPTY_ERROR_MESSAGE);
    }
  }

  void validateEmail(String email) {
    if (!RegConstants().emailRegex.hasMatch(email)) {
      throw new InvalidInformationException(INPUT_ID_ERROR_MESSAGE);
    }
  }

  void validatePassword(String password) {
    if (!RegConstants().upperCase.hasMatch(password) ||
        !RegConstants().lowerCase.hasMatch(password) ||
        !RegConstants().specialCharacters.hasMatch(password)) {
      throw InvalidInformationException(INPUT_PASSWORD_ERROR_MESSAGE);
    }
  }

  signup(String email, String password) =>
      AwsServices().signUp(email, password);

}