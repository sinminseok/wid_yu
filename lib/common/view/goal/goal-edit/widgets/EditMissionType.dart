

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/view/goal/goal-edit/controller/GoalEditController.dart';

import '../../../../utils/Color.dart';

class EditMissionType extends StatelessWidget {
  GoalEditController controller;


  EditMissionType(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 67.w, top: 20.h),
      child: Stack(
        children: [
          Container(
            width: 215.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.selectDrug();
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
                          : Border.all(width: 2.w, color: wPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: controller.drug != true
                            ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: wPurpleColor, // 보라색 테두리 색상
                            width: 1.0, // 테두리 두께
                          ),
                          color: Colors.transparent,
                        )
                            : BoxDecoration(
                            shape: BoxShape.circle, color: wPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "약복용",
                            style: TextStyle(
                                fontWeight: controller.drug ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectOuting();
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
                          : Border.all(width: 2.w, color: wPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: controller.outing != true
                            ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: wPurpleColor, // 보라색 테두리 색상
                            width: 1.0, // 테두리 두께
                          ),
                          color: Colors.transparent,
                        )
                            : BoxDecoration(
                            shape: BoxShape.circle, color: wPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "외출",
                            style: TextStyle(
                                fontWeight: controller.outing ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectCommon();
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
                          : Border.all(width: 2.w, color: wPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: controller.common != true
                            ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: wPurpleColor, // 보라색 테두리 색상
                            width: 1.0, // 테두리 두께
                          ),
                          color: Colors.transparent,
                        )
                            : BoxDecoration(
                            shape: BoxShape.circle, color: wPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "일반",
                            style: TextStyle(
                                fontWeight: controller.common ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
