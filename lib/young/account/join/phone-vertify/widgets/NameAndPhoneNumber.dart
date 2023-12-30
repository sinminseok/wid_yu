import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/join/controller/YoungJoinController.dart';
import 'package:wid_yu/young/account/join/format/PhoneNumberFormat.dart';

import '../../../../../common/utils/Color.dart';
import '../controller/VertifyPhoneController.dart';

class NameAndPhoneNumber extends StatefulWidget {
  VerificationPhoneController verificationPhoneController;


  NameAndPhoneNumber(this.verificationPhoneController);

  @override
  State<NameAndPhoneNumber> createState() => _NameAndPhoneNumberState();
}

class _NameAndPhoneNumberState extends State<NameAndPhoneNumber> {
  int _countdown = 30;
  Timer? _timer;

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameForm(),
          _buildPhoneNumberForm(),
          _buildInputNumber(),
        ],
      ),
    ));
  }

  Widget _buildNameForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 21.h,
            margin: EdgeInsets.only(top: 40.h, left: 20.w),
            child: SubTitle2Text("이름", wGrey700Color)
        ),
        Container(
          width: 335.w,
          height: 46.h,
          margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            border: Border.all(color: wBorderGrey300Color, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            // 힌트 텍스트와 입력란 간의 간격 조정
            child: TextFormField(
              controller: widget.verificationPhoneController.nameController,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.left,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                hintText: "예) 홍길동",
                hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp, fontFamily: "hint"),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 21.h,
            margin: EdgeInsets.only(top: 13.h, left: 20.w),
            child: SubTitle2Text("연락처", wGrey700Color)
        ),
        Stack(
          children: [
            Center(
              child: Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(color: wBorderGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    onChanged: (text){
                      widget.verificationPhoneController.validateRightPhoneNumerFormat();
                      //widget.verificationPhoneController.updateNextStepState();
                    },
                    inputFormatters: [PhoneNumberFormatter()],
                    keyboardType: TextInputType.number,
                    controller: widget.verificationPhoneController.phoneNumberController,
                    style: TextStyle(color: Colors.black, fontFamily: "hint"),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(
                    margin: EdgeInsets.only(top: 20.h, right: 32.w),
                    child: InkWell(
                        onTap: (){
                          widget.verificationPhoneController.sendVertifyNumber();
                          _startCountdown();
                        },
                        child: ButtonText("인증 번호 전송", wPurpleColor))
                ),
              ],
            )

          ],
        ),
        widget.verificationPhoneController.isRightPhoneNumberFormat == -1? Container(
          margin: EdgeInsets.only(top: 8.h,left: 20.w),
          child: HelperText("올바른 휴대폰 형식이 아닙니다.", wErrorColor),
        ): Container(),
        _countdown > 0?Container(
          margin: EdgeInsets.only(top:10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.w),
                    height: 12.h,
                    width: 12.w,
                    child: Image.asset("assets/images/icon/reset-icon.png"),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 22.w),
                      child: HelperText('$_countdown초', wGrey600Color))
                ],
              )
            ],
          ),
        ): Container(
          height: 10.h,
        )
      ],
    );
  }

  Widget _buildInputNumber(){
    return Column(
      children: [
        widget.verificationPhoneController.canInputVertifyNumber?Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 43.h, left: 20.w, right: 20.w),
                  child: SubTitle2Text("인증번호", wGrey700Color)
              ),
              Stack(
                children: [
                  Container(
                    width: 335.w,
                    height: 46.h,
                    margin:
                    EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: wBorderGrey300Color, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      // 힌트 텍스트와 입력란 간의 간격 조정
                      child: TextFormField(
                        controller: widget.verificationPhoneController.verifyNumberController,
                        style: TextStyle(color: Colors.black),
                        // 텍스트 색상을 검정색으로 설정
                        textAlign: TextAlign.left,
                        // 텍스트를 왼쪽으로 정렬
                        cursorColor: kTextBlackColor,
                        decoration: InputDecoration(
                          hintText: "",
                          hintStyle: TextStyle(
                              color: wGrey300Color, fontSize: 14.sp),
                          border: InputBorder.none,
                          isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 22.h,
                      left: 310.w,
                      child: InkWell(
                        onTap: () {
                          print("dasd");
                        },
                        child: Container(
                            child: ButtonText("확인", wPurpleColor)
                        ),
                      )),
                ],
              ),
            ],
          ),
        ):Container()
      ],
    );
  }
}
