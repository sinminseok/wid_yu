
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/dto/young-dto/request/goal/GoalStatusRequest.dart';

import '../../../../common/utils/Color.dart';
import '../../../../final-dto/common-dto/request/goal/GoalTimeGeneratorRequest.dart';
import '../controller/YoungGoalCreateController.dart';

class YoungMissionAddTime extends StatelessWidget {

  YoungGoalCreateController controller;


  YoungMissionAddTime(this.controller);

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

  Widget _buildDrugTimeWidget(GoalTimeGeneratorRequest missionTime) {
    return Container(
      width: 142.w,
      height: 36.h,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: wOrangeColor, width: 1.5.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.w),
            child: ChipText(
                "${missionTime.time}",
                wTextBlackColor
            ),
          ),
          Row(

            children: [
              missionTime.pullNum == null?
                  Container():Container(
                margin: EdgeInsets.only(bottom: 2.h,right: 3.w),
                child: ChipText(
                    "${missionTime.pullNum}개",
                    wGrey500Color
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 7.h, right: 15.w),
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
