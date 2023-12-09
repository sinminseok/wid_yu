import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/common/view/goal/goal-create/controller/GoalCreateController.dart';

import '../../../../utils/Color.dart';
import '../../../../utils/PopUp.dart';
import '../../../../utils/exception/InvalidInformationException.dart';

class MissionText extends StatelessWidget {
  GoalCreateController controller;

  MissionText(this.controller);

  final String INPUT_TITLE_LENGTH_ERROR = "제목은 10글자가 최대입니다.";
  final String INPUT_CONTENT_LENGTH_ERROR = "내용은 20글자가 최대입니다.";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          _buildTitleForm(),
          _buildContentForm(),
        ],
      ),
    );
  }

  Widget _buildTitleForm() {
    return Obx(() => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 0.w),
            child: SubTitle2Text("제목", wGrey700Color),
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  width: 335.w,
                  height: 46.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    border: Border.all(color: wGrey300Color),
                  ),
                  child: TextFormField(
                    controller: controller.titleController,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: "(필수) 목표 제목을 입력해주세요. ",
                      fillColor: Colors.black87,
                      // 텍스트 색상을 검정색으로 변경
                      // 텍스트 색상을 검정색으로 변경
                      prefixStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                          color: wGrey300Color,
                          fontSize: 14.sp,
                          fontFamily: "hint"),
                      contentPadding:
                      EdgeInsets.only(left: 14.w, top: 12.h),
                    ),

                    maxLength: 10,
                    //maxLength: 10,
                    onChanged: (value) {
                      controller.onChangeTitleText();
                      controller.validateCanSave();
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child:HelperText("${controller.titleTextLength?.value}/10", wGrey600Color)
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget _buildContentForm() {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 0.w),
            child: SubTitle2Text("설명", wGrey700Color),
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  width: 335.w,
                  height: 46.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    border: Border.all(color: wGrey300Color),
                  ),
                  child: TextFormField(
                    controller: controller.contentController,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: "(선택) 약의 설명을 적어보세요.",
                      fillColor: Colors.black87,
                      // 텍스트 색상을 검정색으로 변경
                      // 텍스트 색상을 검정색으로 변경
                      prefixStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                          color: wGrey300Color,
                          fontSize: 14.sp,
                          fontFamily: "hint"),
                      contentPadding:
                      EdgeInsets.only(left: 14.w, top: 12.h),
                    ),

                    maxLength: 20,
                    //maxLength: 10,
                    onChanged: (value) {
                      controller.onChangeContentText();
                      controller.validateCanSave();
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child:HelperText("${controller.contentTextLength?.value}/20", wGrey600Color)
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
