
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../controller/OldGoalCreateController.dart';



class OldMissionType extends StatelessWidget {
  OldGoalCreateController controller;

  OldMissionType(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
      child: Container(
        margin: EdgeInsets.only(left: 67.w, top: 20.h),
        child: Stack(
          children: [
            Container(
              width: 215.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: wGrey300Color)),
            ),
            Row(
              children: [
                _buildDrugSelect(),
                _buildWalkSelect(),
                _buildCommonSelect(),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildDrugSelect(){
    return InkWell(
      onTap: () {
        controller.selectDrugType();
        controller.validateCanSave();
      },
      child: Container(
        width: 71.5.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: controller.drug != true
                ? Colors.transparent
                : wPurpleBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: controller.drug != true
                ? null
                : Border.all(width: 1.5.w, color: wPurpleColor)),
        child: Column(
          children: [
            controller.drug ?_buildSelectPurpleCircle(): _buildPurpleCircle(),
            Container(
                margin: EdgeInsets.only(top: 3.h),
                height: 21.h,
                child: Center(
                    child: controller.drug ? SubTitle2Text("약복용", wTextBlackColor) : Body2Text("약복용", wGrey700Color)
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWalkSelect(){
    return InkWell(
      onTap: () {
        controller.selectWalkType();
        controller.validateCanSave();
      },
      child: Container(
        width: 71.5.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: controller.outing != true
                ? Colors.transparent
                : wPurpleBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: controller.outing != true
                ? null
                : Border.all(width: 1.5.w, color: wPurpleColor)),
        child: Column(
          children: [
            controller.outing ?_buildSelectPurpleCircle(): _buildPurpleCircle(),
            Container(
                margin: EdgeInsets.only(top: 3.h),
                height: 21.h,
                child: Center(
                    child: controller.outing ? SubTitle2Text("외출", wTextBlackColor) : Body2Text("외출", wGrey700Color)
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCommonSelect() {
    return InkWell(
      onTap: () {
        controller.selectCommonType();
        controller.validateCanSave();
      },
      child: Container(
        width: 71.5.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: controller.common != true
                ? Colors.transparent
                : wPurpleBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: controller.common != true
                ? null
                : Border.all(width: 1.5.w, color: wPurpleColor)),
        child: Column(
          children: [
            controller.common ?_buildSelectPurpleCircle(): _buildPurpleCircle(),
            Container(
                margin: EdgeInsets.only(top: 3.h),
                height: 21.h,
                child: Center(
                    child: controller.common ? SubTitle2Text("일반", wTextBlackColor) : Body2Text("일반", wGrey700Color)
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectPurpleCircle(){
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 11.w,
              height: 11.h,
              decoration: BoxDecoration(
                  color: wWhiteColor,
                  border: Border.all(color: wPurpleColor),
                  shape: BoxShape.circle
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 2.h),
              width: 7.w,
              height: 7.h,
              decoration: BoxDecoration(
                  color: wPurpleColor,
                  shape: BoxShape.circle
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurpleCircle() {
    return Container(
      margin: EdgeInsets.only(top: 7.h),
      width: 11.w,
      height: 11.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: wWhiteColor,
          border: Border.all(color: wPurpleColor)
      ),
    );
  }
}

