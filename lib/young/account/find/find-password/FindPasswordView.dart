import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/find/find-id/view/FindIdView.dart';
import 'package:wid_yu/young/account/find/find-password/FindPasswordSuccessView.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';
import '../../join/login-information/IdAndPasswordView.dart';
import '../../join/phone-vertify/VertifyPhoneView.dart';
import '../../login/view/YoungLoginView.dart';
import '../find-id/view/FindIdSuccessView.dart';

class FindPasswordView extends StatefulWidget {
  const FindPasswordView({Key? key}) : super(key: key);

  @override
  _PasswordFindView createState() => _PasswordFindView();
}

class _PasswordFindView extends State<FindPasswordView> {
  /*
  0 일때 비밀번호 찾기 위젯
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
        color: wWhiteColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            isSuccessFind == 0 ? _buildDuringFind() : Container(),
            isSuccessFind == -1 ? _buildFaliFind() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildDuringFind() {
    return Container(
      height: 600.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildFindText(),
              _buildUserInformation(),
              _buildVerityNumbers(),
            ],
          ),
          _buildFindIdButton()
        ],
      ),
    );
  }

  Widget _buildFindIdButton() {
    return Container(
        margin: EdgeInsets.only(top: 0.h),
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
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildFaliFindText(),
              _buildUserInformation(),
              _buildVerityNumbers(),
            ],
          ),
          _buildRetryButton(),

        ],
      ),
    );
  }

  Widget _buildRetryButton() {
    return Container(
      margin: EdgeInsets.only(top: 118.h),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: (VerificationPhoneView())));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: ButtonText("회원 가입하러 가기 ", wPurpleColor)
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios_outlined, color: wPurpleColor,size: 15.sp,),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FindPasswordSuccessView()),
                        (route) => false);
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: OrangeButton("다시찾기")))
        ],
      ),
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
        Center(
          child: Container(
            height: 33.h,
            margin: EdgeInsets.only(top: 10.h),
            child: Title2Text("등록된 정보와 일치하는 비밀번호가 없어요.", wGrey800Color)
          ),
        ),
        Container(
          height: 21.h,
          margin: EdgeInsets.only(top: 4.h),
          child: SubTitle2Text("혹시 정보를 잘못 입력하지는 않았나요?", wGrey600Color)
        )
      ],
    );
  }

  Widget _buildFindText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30.h,
          margin: EdgeInsets.only(top: 28.h),
          child: Title2Text("비밀번호 찾기", wGrey800Color)
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          height: 21.h,
          child: Body2Text("비밀번호를 찾기 위한 정보를 입력해 주세요.", wGrey600Color)
        )
      ],
    );
  }

  Widget _buildVerityNumbers() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 63.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text("인증번호", wGrey700Color)
          ),
          Stack(children: [
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
            Positioned(
                top: 20.h,
                left: 275.w,
                child: InkWell(
                  onTap: () {
                    print("dasd");
                  },
                  child: Container(
                      child: ButtonText("확인", wPurpleColor)
                  ),
                ))
          ])
        ],
      ),
    );
  }

  Widget _buildUserInformation() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 21.h,
            margin: EdgeInsets.only(top: 28.h),
            child: SubTitle2Text("이름", wGrey700Color)
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 6.h),
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
              height: 21.h,
              margin: EdgeInsets.only(top: 13.h),
              child: SubTitle2Text("아이디", wGrey700Color)
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 6.h),
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
              height: 21.h,
              margin: EdgeInsets.only(top: 13.h),
              child: SubTitle2Text("연락처", wGrey700Color)
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 6.h),
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
                  top: 17.h,
                  left: 213.w,
                  child: InkWell(
                    onTap: () {
                      print("dasd");
                    },
                    child: Container(
                      child: ButtonText("인증 번호 전송", wPurpleColor)
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
