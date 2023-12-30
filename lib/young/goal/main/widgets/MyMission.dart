import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/mission/TotalMissionWidget.dart';
import 'package:wid_yu/young/goal/main/controller/YoungGoalController.dart';
import 'package:wid_yu/young/goal/goal-detail/view/YoungGoalDetailView.dart';

import '../../../../common/common-widget/mission/MissionWidget.dart';
import '../../../../common/utils/Color.dart';

class MyMission extends StatelessWidget {
  final YoungGoalController controller;

  MyMission({required this.controller});

  @override
  Widget build(BuildContext context) {
//EmptyMissionGroupWidget
    return Obx(() => controller.switchValue.value
        ? _buildTotalMission()
        : _buildTodayMission());
  }

  Widget _buildTodayMission() {
    return InkWell(
      onTap: () {
        Get.to(() => YoungGoalDetailView(), transition: Transition.fadeIn);
      },
      child: Container(
        width: 335.w,
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
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

  List<Widget> _buildMissionWidgets() {
    List<Widget> missionWidgets = [];

    for (int index = 0; index < controller.myMission.length; index++) {
      missionWidgets.add(MissionWidget(controller.myMission[index]));

      if (index < controller.myMission.length - 1) {
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

  Widget _buildTotalMission() {
    return Container(
      width: 335.w,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
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

  List<Widget> _buildTotalMissionWidgets() {
    List<Widget> missionWidgets = [];

    for (int index = 0; index < controller.myMission.length; index++) {
      missionWidgets.add(
          TotalMissionWidget(controller.myMission[index]));

      if (index < controller.myMission.length - 1) {
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
