
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/goal/goal-edit/controller/GoalEditController.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import 'package:wid_yu/young/goal/goal-edit/dto/GoalTimeEditRequest.dart';

import '../../../../common/utils/Color.dart';
import '../../../../final-dto/common-dto/request/goal/GoalTimeGeneratorRequest.dart';


class EditMissionAddTime extends StatelessWidget {

  GoalEditController controller;


  EditMissionAddTime(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        width: 340.w,
        height: 50.h,
        margin: EdgeInsets.only(top: 10.h, left: 20.w),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.addTimes.value.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return _buildDrugTimeWidget(controller.addTimes.value[idx]);
            }
        )
    ));
  }

  Widget _buildDrugTimeWidget(GoalTimeEditRequest goalTime) {
    return Container(
      width: 125.w,
      height: 36.h,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: wOrangeColor, width: 1.5.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: ChipText(
              "${goalTime.time}",
                wTextBlackColor
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: ChipText(
                  "3개",
                    wGrey500Color
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 7.h, left: 3.w),
                width: 15.w,
                height: 15.sp,
                child: InkWell(
                  onTap: (){
                    controller.deleteTime(goalTime);
                    controller.validateCanSave();
                  },
                  child: Icon(
                    Icons.cancel,
                    color: wOrangeColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
