import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/OrangeButton.dart';

import '../../../../common/model/account/AwsServices.dart';
import '../../../../common/utils/Color.dart';
import '../../../frame/YoungFrameView.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool ischeck = false;
  bool isWrongInformation = false;
  bool _obscurePassword = true;
  TextEditingController _idController = TextEditingController();
  TextEditingController _passworController = TextEditingController();

  login(String email, String password) => AwsServices().login(email, password);

  void validateInforamtion(){
    setState(() {
      isWrongInformation = !isWrongInformation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserInformationTextField(),
        _buildAutoLoginCheckBox(),
        _buildLoginButton(),
      ],
    );
  }

  Widget _buildUserInformationTextField() {
    return Column(
      children: [
        _buildLoginForm(),
        _buildPasswordForm(),
      ],
    );
  }

  Widget _buildLoginForm(){
    return Container(
      width: 335.w,
      margin: EdgeInsets.only(top: 58.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: isWrongInformation?wErrorColor:wBorderGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // 힌트 텍스트와 입력란 간의 간격 조정
              child: TextFormField(
                controller: _idController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "아이디",
                  hintStyle:
                  TextStyle(color: wGrey300Color, fontSize: 14.sp),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          isWrongInformation?Container(
            margin: EdgeInsets.only(top: 5.h,left: 5.w),
            child: Text("아이디를 다시 입력해 보세요.", style: TextStyle(color: wErrorColor, fontSize: 14.sp),),
          ):Container()
        ],
      ),
    );
  }

  Widget _buildPasswordForm(){
    return Container(
      width: 335.w,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: isWrongInformation?wErrorColor: wBorderGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // 힌트 텍스트와 입력란 간의 간격 조정
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextFormField(
                    controller: _passworController,
                    obscureText: _obscurePassword,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "비밀번호",
                      hintStyle:
                      TextStyle(color: wGrey300Color, fontSize: 14.sp),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isWrongInformation?Container(
            margin: EdgeInsets.only(top: 0.h,left: 5.w),
            child: Text("비밀번호를 다시 입력해 보세요.", style: TextStyle(color: wErrorColor, fontSize: 14.sp),),
          ):Container()
        ],
      ),
    );
  }

  Widget _buildAutoLoginCheckBox() {
    return Container(
      margin: EdgeInsets.only(right: 165.w, bottom: 20.h),
      width: 185.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.black, // 테두리 색 (unchecked 상태의 색)
            ),
            child: Checkbox(
              focusColor: Colors.grey,
              checkColor: wTextBlackColor,
              activeColor: Colors.white,
              // 체크된 상태의 배경색
              value: ischeck,
              onChanged: (value) {
                setState(() {
                  ischeck = value!;
                });
              },
              side: BorderSide(
                  color: ischeck ? Colors.black : Colors.black), // 테두리 색상 변경
            ),
          ),
          Text(
            "자동로그인",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: wTextBlackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return InkWell(
      onTap: () {
        //validateInforamtion();
        login(_idController.text, _passworController.text);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: (YoungFrameView(0))));
      },
      child: Container(
          margin: EdgeInsets.only(top: 0.h),
          child: OrangeButton(
            '로그인',
          )),
    );
  }
}
