

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungGoalCreateController.dart';

class YoungMissionTerm extends StatelessWidget {
  YoungGoalCreateController controller;


  YoungMissionTerm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText(),
            _buildSelectDay(),
          ],
        )));
  }

  Widget _buildText(){
    return Container(
      child: SubTitle2Text(
          "복용주기",
          wGrey700Color
      ),
    );
  }

  Widget _buildSelectDay(){
    return  Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.monday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectMonday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("월", controller.monday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.tuesday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectTuesday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("화", controller.tuesday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.wednesday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectWednesday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("수", controller.wednesday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.thursday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectThursday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("목", controller.thursday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.friday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectFriday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("금", controller.friday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.saturday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectSaturday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("토", controller.saturday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 54.h,
            decoration: controller.sunday
                ? BoxDecoration(
                color: wOrangeColor,
                border: Border.all(color: wOrange200Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5)))
                : BoxDecoration(
                color: wGrey100Color,
                border: Border.all(color: wGrey300Color),
                borderRadius:
                BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: (){
                controller.selectSunday();
                controller.validateCanSave();
              },
              child: Center(
                child: ChipText("일", controller.sunday ? wWhiteColor : wGrey500Color,),
              ),
            ),

          ),

        ],
      ),
    );
  }
}


