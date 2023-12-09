
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/widgets/TextFormWidget.dart';

class DiseaseForm extends StatelessWidget {
  final OldInformationController controller;


  DiseaseForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isDisease == 1
        ? Center(
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        width: 340.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDrugNameForm(),
            _buildDiseaseForm(),
            _buildDrugInformationForm(),
          ],
        ),
      ),
    )
        : Container(
      height: 80.h,
    ));
  }

  Widget _buildDrugNameForm() {
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text(
                "질병이름",
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
                  controller.updateNextStepState();
                },
                controller: controller.diseaseNameController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "예) 치매, 위암, ...",
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

  Widget _buildDiseaseForm() {
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text(
                "복용 중인 약",
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
                  controller.updateNextStepState();
                },
                controller: controller.drugNameController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "예) 아리셉트, ...",
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

  Widget _buildDrugInformationForm(){
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 13.h,bottom: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text(
                "설명(선택)",
                wGrey700Color
            ),
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                height: 132.h,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wGrey300Color),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Container(
                  height: 132.h,
                  margin: EdgeInsets.only(top: 0.h, left: 10.w),
                  child: TextFormField(
                    onChanged: (text) {
                      // 현재 텍스트필드의 텍스트를 출력
                      controller.onChangeDrugText();
                    },
                    controller: controller.drugInformationController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      counterText: "",

                      hintText:
                      "질병에 관련된 자세한 설명이나\n응급상황시 구조자가 알아야 하는 설명을 적어주세요.",
                      hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey.shade500),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                    maxLines: null,
                    maxLength: 100,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child:HelperText("${controller.drugInformationTextLength?.value}/100", wGrey600Color)
              ),

            ],
          )
        ],
      ),
    );
  }
}
