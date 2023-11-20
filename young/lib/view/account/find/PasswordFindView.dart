import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/common-widget/OrangeButton.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/FilePath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../join/IdAndPasswordView.dart';
import '../login/YoungLoginView.dart';

class PasswordFindView extends StatefulWidget {
  const PasswordFindView({Key? key}) : super(key: key);

  @override
  _PasswordFindView createState() => _PasswordFindView();
}

class _PasswordFindView extends State<PasswordFindView> {
  /*
  0 일때 비밀번호 찾기 위젯
  1일때 비밀번호 찾기 성공 위젯
  -1일때 비밀번호 찾기 실패 위젯
  */
  int isSuccessFind = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kTextWhiteColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            isSuccessFind == 0 ? _buildDuringFind() : Container(),
            isSuccessFind == -1 ? _buildFaliFind() : Container(),
            isSuccessFind == 1 ? _buildSuccessFind() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildDuringFind() {
    return Column(
      children: [
        _buildFindText(),
        _buildUserInformation(),
        _buildVerityNumbers(),
        _buildFindIdButton()
      ],
    );
  }

  Widget _buildFindIdButton() {
    return Container(
        margin: EdgeInsets.only(top: 170.h),
        child: InkWell(
            onTap: () {
              print("das");
              setState(() {
                isSuccessFind = -1;
              });
            },
            child: OrangeButton("비밀번호 찾기")));
  }

  Widget _buildFaliFind() {
    return Column(
      children: [
        _buildFaliFindText(),
        _buildUserInformation(),
        _buildVerityNumbers(),
        _buildRetryButton(),
      ],
    );
  }

  Widget _buildRetryButton() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: (IdAndPasswordView())));
            },
            child: Text(
              "회원 가입하러 가기 >",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: wPurpleColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        InkWell(
            onTap: () {
              setState(() {
                isSuccessFind = 1;
              });
            },
            child: Container(
                margin: EdgeInsets.only(top: 10.h),
                child: OrangeButton("다시찾기")))
      ],
    );
  }

  Widget _buildFaliFindText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 98.w,
          height: 104.h,
          child: Image.asset(commonImagePath + "icon/red_alarm_icon.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Text(
            "등록된 정보와 일치하는 비밀번호가 없어요.",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: wTextBlackColor),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text(
            "혹시 정보를 잘못 입력하지는 않았나요?.",
            style: TextStyle(
                color: wGrey600Color,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Widget _buildFindText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Text(
            "비밀번호 찾기",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: wTextBlackColor),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text(
            "비밀번호를 찾기 위한 정보를 입력해 주세요.",
            style: TextStyle(
                color: wGrey600Color,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Widget _buildVerityNumbers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h),
          child: Text(
            "인증번호",
            style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
          ),
        ),
        Container(
          width: 335.w,
          height: 46.h,
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            border: Border.all(color: wBorderGrey300Color, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            // 힌트 텍스트와 입력란 간의 간격 조정
            child: TextFormField(
              controller: _verifyNumberController,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.left,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                hintText: "",
                hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInformation() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Text(
              "이름",
              style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: wBorderGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // 힌트 텍스트와 입력란 간의 간격 조정
              child: TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "예) 홍길동",
                  hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              "연락처",
              style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wBorderGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _nameController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "숫자만 입력",
                      hintStyle:
                          TextStyle(color: wGrey300Color, fontSize: 14.sp),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 15.h,
                  left: 240.w,
                  child: InkWell(
                    onTap: () {
                      print("dasd");
                    },
                    child: Container(
                      child: Text(
                        "인증 번호 전송",
                        style: TextStyle(
                            color: wPurpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSuccessFind() {
    return Column(
      children: [
        _buildMainText(),
        _buildFindInformation(),
        _buildGoFindPassword(),
        InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => YoungLoginView()),
                  (route) => false);
            },
            child: _buildButton()),
      ],
    );
  }

  Widget _buildMainText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Text(
              "비밀번호를 찾았어요!",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text(
            "해당 정보로 가입된 아이디가 있어요.",
            style: TextStyle(color: kTextBlackColor, fontSize: 15.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildFindInformation() {
    return Container(
      width: 335.h,
      margin: EdgeInsets.only(top: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "이름",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "신민석",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "연락처",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "01012341234",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "아이디",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "sin1768",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "비밀번호",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "123456",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 110.w,
            height: 94.h,
            child: Image.asset("assets/common/user/youngManBox.png"),
          )
        ],
      ),
    );
  }

  Widget _buildGoFindPassword() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: InkWell(
          onTap: () {},
          child: Text(
            "비밀번호 찾기",
            style:
                TextStyle(color: kTextGreyColor, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _buildButton() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 335.w,
        height: 44.h,
        decoration: BoxDecoration(
            color: wOrangeColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            "로그인 하러가기",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
