

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/account/join/format/PhoneNumberFormat.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';

import '../../../../../common/utils/CustomText.dart';

class OldInformationForm extends StatelessWidget {
  final OldInformationController controller;


  OldInformationForm({required this.controller});



  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            _buildNameForm(),
            _buildBirthForm(),
            _buildPhoneNumberForm(),
            _buildAddressForm(context),
          ],
        ),
      ),
    ));
  }

  Widget _buildNameForm(){
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            child: SubTitle2Text(
                "이름",
                wGrey700Color
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h,left: 10.w),
              child: TextFormField(
                onChanged: (text){
                  controller.updateNextStepState();
                },

                keyboardType: TextInputType.name,
                controller: controller.nameController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "ex)홍길동",
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(fontSize: 13.sp,color: wGrey300Color, fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBirthForm(){
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text("출생연도", wGrey700Color),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h, left: 10.w),
              child: TextFormField(
                onChanged: (text) {

                  // 현재 텍스트필드의 텍스트를 출력
                  // controller.validateRightBirthFormat();
                  controller.updateNextStepState();
                },
               // inputFormatters: [BirthDateInputFormatter()],
                keyboardType: TextInputType.number,
                controller: controller.ageController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "1990.00.00",
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: wGrey300Color,
                      fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          controller.isRightBirthFormat == -1? Container(
            margin: EdgeInsets.only(top: 6.h),
            child: HelperText("올바른 출생 연도 형식이 아닙니다.", wErrorColor),
          ): Container()
        ],
      ),
    ));
  }

  Widget _buildPhoneNumberForm(){
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text(
                "연락처",
                wGrey700Color
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h,left: 10.w),
              child: TextFormField(
                onChanged: (text) {
                  // 현재 텍스트필드의 텍스트를 출력
                  controller.validateRightPhoneNumerFormat();
                  controller.updateNextStepState();
                },
                inputFormatters: [PhoneNumberFormatter()],
                keyboardType: TextInputType.number,
                controller: controller.phoneNumberController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "010 0000 0000",
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(fontSize: 13.sp,color: wGrey300Color, fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          controller.isRightPhoneNumberFormat == -1? Container(
            margin: EdgeInsets.only(top: 6.h),
            child: HelperText("올바른 휴대폰 형식이 아닙니다.", wErrorColor),
          ): Container()
        ],
      ),
    ));
  }

  Widget _buildAddressForm(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 43.h),
            child: SubTitle2Text(
                "집주소",
                wGrey700Color
            ),
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                // height: 46.h,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Container(
                    margin: EdgeInsets.only(top: 13.h,left: 10.w),
                    child: controller.addressController != ""?
                    Container(
                      width: 220.w,
                      margin: EdgeInsets.only(right: 55.w, bottom: 13.h),
                      child: Body2Text("${controller.addressController}", wTextBlackColor),
                    ): Container(
                        margin: EdgeInsets.only(bottom: 13.h),
                        child: HintText("도로명 주소찾기", wGrey300Color))
                ),
              ),
              Positioned(
                left: 300.w,
                top: 18.h,
                child: Container(
                  child: InkWell(
                      onTap: ()async{
                       controller.addressAPI(context);
                      },
                      child: Icon(Icons.search, color: wGrey800Color,size: 29.sp,)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
