
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/goal/main/controller/OldGoalController.dart';
import 'package:wid_yu/old/goal/goal-detail/view/OldGoalDetailView.dart';

import '../../../../common/common-widget/mission/EmptyGoal.dart';
import '../../../../common/common-widget/mission/MissionWidget.dart';
import '../../../../common/common-widget/mission/TotalMissionWidget.dart';
import '../../../../common/utils/Color.dart';

/*
부모님 목표 위젯
 */
class MyMission extends StatelessWidget {

  OldGoalController controller;

  MyMission(this.controller);

  @override
  Widget build(BuildContext context) {

    return Obx(() => controller.switchValue?_buildTotalMission(): _buildTodayMission());
  }

  Widget _buildTotalMission() {
    return controller.totalGoals?.length == 0 ?EmptyGoal(true):Container(
      width: 335.w,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 60.h),
      decoration: BoxDecoration(
        border: Border.all(color: wGrey100Color),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: _buildTotalMissionWidgets(),
        ),
      ),
    );
  }

  Widget _buildTodayMission() {
    return controller.todayGoals?.length == 0 ?EmptyGoal(true):InkWell(
      onTap: () {
        //Get.to(() => OldGoalDetailView(), transition: Transition.fadeIn);
      },
      child: Container(
        width: 335.w,
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 60.h,top: 10.h),
        decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: _buildMissionWidgets(),
          ),
        ),
      ),
    );
  }


  List<Widget> _buildTotalMissionWidgets() {
    List<Widget> missionWidgets = [];
    for (int index = 0; index < controller.totalGoals!.length; index++) {
      missionWidgets.add(
          TotalMissionWidget(true,controller.totalGoals![index]));
      if (index < controller.totalGoals!.length - 1) {
        missionWidgets.add(
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 340,
            height: 1,
            color: kLightGreyColor,
          ),
        );
      } else {
        missionWidgets.add(Container(
          height: 15.h,
        ));
      }
    }
    return missionWidgets;
  }

  List<Widget> _buildMissionWidgets() {
    List<Widget> missionWidgets = [];

    for (int index = 0; index < controller.todayGoals!.length; index++) {
      missionWidgets.add(MissionWidget(true,controller.todayGoals![index]));

      if (index < controller.todayGoals!.length - 1) {
        missionWidgets.add(
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 340,
            height: 1,
            color: kLightGreyColor,
          ),
        );
      } else {
        missionWidgets.add(Container(
          height: 15.h,
        ));
      }
    }

    return missionWidgets;
  }

}
