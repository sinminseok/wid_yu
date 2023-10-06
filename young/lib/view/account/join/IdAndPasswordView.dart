import 'package:common/model/account/AwsServices.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/Permission.dart';
import 'package:common/utils/PopUp.dart';
import 'package:common/utils/exception/InvalidInformationException.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/utils/RegConstants.dart';
import 'package:young/view/account/join/widgets/SignupAppBar.dart';

import 'OldInformationView.dart';

class IdAndPasswordView extends StatefulWidget {
  const IdAndPasswordView({Key? key}) : super(key: key);

  @override
  _IdAndPasswordView createState() => _IdAndPasswordView();
}

class _IdAndPasswordView extends State<IdAndPasswordView> {
  static String INPUT_EMPTY_ERROR_MESSAGE = "모든 값을 입력해주세요.";
  static String INPUT_ID_ERROR_MESSAGE = "아이디는 이메일 형식으로 입력해주세요.";
  static String INPUT_PASSWORD_ERROR_MESSAGE =
      "비밀번호는 대,소문자와 특수문자를 포함한 8자리로 만들어야 합니다.";

  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void validateInformation(String email, String password) {
    validateEmpty(email, password);
    validateEmail(email);
    validatePassword(password);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(
        stepNumber: 1,
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderText(),
              _buildIdTextField(),
              _buildPasswordTextField(),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
        margin: EdgeInsets.only(top: 280.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                try {
                  validateInformation(
                      _idController.text, _passwordController.text);
                  signup(_idController.text, _passwordController.text);
                } catch (e) {
                  if (e is InvalidInformationException) {
                    ToastMessage().showtoast(e.cause);
                  }
                }
              },
              child: Container(
                width: 158.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text("바로 계정생성"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: (OldInformationView())));
              },
              child: Container(
                width: 158.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text("시지어 계정생성 계속하기"),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildHeaderText() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, bottom: 10.h),
      child: const Text(
        "사용하실 아이디와 비밀번호를 입력해주세요.",
        style: TextStyle(color: kTextBlackColor),
      ),
    );
  }

  Widget _buildIdTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.w, top: 10.h),
          child: const Text(
            "아이디",
            style: TextStyle(color: kTextBlackColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240.w,
              height: 40.h,
              margin: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                  color: kBlankColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                controller: _idController,
                textAlign: TextAlign.center,
                cursorColor: kTextBlackColor,
                obscureText: false,

                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.,
                    hintText: "",
                    border: InputBorder.none),
              ),
            ),
            Container(
              width: 60.w,
              height: 40.h,
              margin: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0), // 오른쪽 위 모서리 둥글기 설정
                    bottomRight: Radius.circular(10.0), // 오른쪽 아래 모서리 둥글기 설정
                  ),
                  color: kButtonColor),
              child: Center(
                  child: Text(
                "중복확인",
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "비밀번호",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: 300.w,
            height: 40.h,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
                color: kBlankColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.center,
              cursorColor: kTextBlackColor,
              obscureText: true,
              controller: _passwordController,

              decoration: InputDecoration(
                  // contentPadding: EdgeInsets.,
                  hintText: "",
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
