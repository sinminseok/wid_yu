import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../common/model/account/AwsServices.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/PopUp.dart';
import '../../../common/utils/exception/InvalidInformationException.dart';
import '../../utils/RegConstants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(1),
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
      margin: EdgeInsets.only(top: 190.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                try {
                  // validateInformation(
                  //     _idController.text, _passwordController.text);
                  // signup(_idController.text, _passwordController.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: (OldInformationView())));

                } catch (e) {
                  if (e is InvalidInformationException) {
                    ToastMessage().showtoast(e.cause);
                  }
                }
              },
              child: Container(
                width: 108.w,
                height: 44.h,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text("내 계정만 생성", style: TextStyle(fontSize: 15.sp,color: Colors.grey.shade800),),
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
                width: 221.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: wOrangeColor,
                    border: Border.all(color: Colors.orangeAccent),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text("계속해서 부모님 계정 생성",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                ),
              ),
            ),
          ],
        ));

  }
  Widget _buildHeaderText() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h),
      child: Text(
        "사용하실 아이디와 비밀번호를\n설정해주세요.",
        style: TextStyle(
          color: kTextBlackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  Widget _buildIdTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 30.h),
          child:  Text(
            "아이디",
            style: TextStyle(color: kTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: wGrey300Color),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 5.h,left: 10.w),
                child: TextFormField(
                  controller: _idController,
                  style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "이메일 형식으로 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 13.sp,color: Colors.grey.shade500),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            )

          ],
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 15.h),
          child:  Text(
            "비밀번호",
            style: TextStyle(color: kTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: wGrey300Color),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 5.h,left: 10.w),
                child: TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "영문, 숫자, 특수기호를 조합하여 8~12자.",
                    hintStyle: TextStyle(fontSize: 13.sp,color: Colors.grey.shade500),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            )

          ],
        ),
      ],
    );

  }
}
