

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/view/goal/goal-edit/controller/GoalEditController.dart';

import '../../../../utils/Color.dart';

class EditMissionTerm extends StatelessWidget {
  GoalEditController controller;


  EditMissionTerm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: EdgeInsets.only(top: 30.h, left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "복용주기",
                style: TextStyle(
                    color: wGrey700Color,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.selectMondayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("월",
                            style: TextStyle(
                                color: controller.monday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectTuesdayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("화",
                            style: TextStyle(
                                color:
                                controller.tuesday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectWednesdayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("수",
                            style: TextStyle(
                                color:
                                controller.wednesday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectThursdayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("목",
                            style: TextStyle(
                                color:
                                controller.thursday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectFridayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("금",
                            style: TextStyle(
                                color: controller.friday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectSaturdayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("토",
                            style: TextStyle(
                                color:
                                controller.saturday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectSundayTerm();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
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
                      child: Center(
                        child: Text("일",
                            style: TextStyle(
                                color: controller.sunday ? wWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
