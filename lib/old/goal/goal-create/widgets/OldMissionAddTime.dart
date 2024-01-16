
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/view/goal/goal-create/controller/GoalCreateController.dart';

import '../../../../common/utils/Color.dart';
import '../controller/OldGoalCreateController.dart';

class OldMissionAddTime extends StatelessWidget {

  OldGoalCreateController controller;


  OldMissionAddTime(this.controller);

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

  Widget _buildDrugTimeWidget(GoalTime missionTime) {
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
                "${missionTime.time}",
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
                    controller.deleteTime(missionTime);
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
