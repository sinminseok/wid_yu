import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../common/common-widget/OrangeButton.dart';
import '../../../common/utils/Color.dart';
import 'IdAndPasswordView.dart';

class VerifyPhoneView extends StatefulWidget {
  const VerifyPhoneView({Key? key}) : super(key: key);

  @override
  _VerifyPhoneViewState createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends State<VerifyPhoneView> {
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
      resizeToAvoidBottomInset: true,
      appBar: SignUpAppBar(
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(1),
            _buildMainText(),
            _buildUserInformation(),
            _buildVerityNumbers(),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(){
    return Center(child: Container(
        margin: EdgeInsets.only(top: 130.h),
        child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: (IdAndPasswordView())));
            },
            child: OrangeButton("다음"))));
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h,left: 15.w),
      child: Text(
        "보호자님의 본인인증을 해주세요.",
        style: TextStyle(
            color: wGrey800Color, fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
    );
  }

  Widget _buildVerityNumbers() {
    return Center(
      child: Column(
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
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
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
      ),
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
}
