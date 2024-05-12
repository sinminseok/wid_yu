

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/account/find/find-id/controller/FindIdController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/CustomText.dart';
import '../../../join/format/PhoneNumberFormat.dart';

class IdPhoneNumberForm extends StatelessWidget {

  FindIdController controller;


  IdPhoneNumberForm(this.controller);

  @override
  Widget build(BuildContext context) {
    return _buildUserInformation();
  }

  Widget _buildUserInformation() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameForm(),
          _buildPhoneNumberForm(),
        ],
      ),
    );
  }

  Widget _buildNameForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 21.h,
            margin: EdgeInsets.only(top: 30.h),
            child: SubTitle2Text("이름", wGrey700Color)
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
            padding: EdgeInsets.only(left: 16,top: 2.h),
            // 힌트 텍스트와 입력란 간의 간격 조정
            child: TextFormField(
              controller: controller.nameController,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.left,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                hintText: "예) 홍길동",
                hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: "hint"),
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
          margin: EdgeInsets.only(top: 19.h),
          child: Container(
              height: 21.h,
              margin: EdgeInsets.only(top: 0.h),
              child: SubTitle2Text("연락처", wGrey700Color)
          ),
        ),
        Stack(
          children: [
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: wBorderGrey300Color, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                // 힌트 텍스트와 입력란 간의 간격 조정
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [PhoneNumberFormatter()],
                  controller: controller.phoneNumberController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "숫자만 입력",
                    hintStyle: TextStyle(color: wGrey300Color,fontFamily: "hint", fontSize: 14.sp, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
            // Positioned(
            //     top: 20.h,
            //     right: 10.w,
            //     child: InkWell(
            //       onTap: () {
            //         controller.sendNumber();
            //       },
            //       child: Container(
            //           child: ButtonText("인증 번호 전송", wPurpleColor)
            //       ),
            //     ))
          ],
        )
      ],
    );
  }
}
