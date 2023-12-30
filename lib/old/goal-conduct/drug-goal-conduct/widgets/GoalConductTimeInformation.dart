import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/mission-time/MissionTimeWidget.dart';
import 'package:wid_yu/common/model/mission/MissionTime.dart';
import 'package:wid_yu/common/model/mission/TimeType.dart';
import 'package:wid_yu/old/goal-conduct/drug-goal-conduct/controller/OldDrugConductController.dart';

class GoalConductTimeInformation extends StatelessWidget {
  OldDrugConductController controller;

  GoalConductTimeInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    List<MissionTime> times = [
      MissionTime("13:00", TimeType.DONE),
      MissionTime("13:00", TimeType.DONE),
      MissionTime("13:00", TimeType.NONE),
      MissionTime("13:00", TimeType.YET),
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
