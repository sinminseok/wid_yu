import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/mission-time/MissionTimeWidget.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/old/goal-conduct/drug-goal-conduct/controller/OldDrugConductController.dart';

import '../../../../common/dto/goal/GoalTimeStatus.dart';


class GoalConductTimeInformation extends StatelessWidget {
  OldDrugConductController controller;

  GoalConductTimeInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    List<GoalTime> times = [
      GoalTime("13:00", GoalTimeStatus.DONE, null,null),
      GoalTime("13:00", GoalTimeStatus.DONE, null,null),
      GoalTime("13:00", GoalTimeStatus.NONE, null,null),
      GoalTime("13:00", GoalTimeStatus.YET, null,null),
    ];
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 30.h),
            child: MissionTimeWidget(times, context)),
        Container(
          margin: EdgeInsets.only(top: 35.h),
          width: 200.w,
          height: 197.h,
          child: Image.asset("assets/images/mission/drug-mission.png"),
        )
      ],
    );
  }
}
