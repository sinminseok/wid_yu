import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/mission-time/MissionTimeWidget.dart';
import '../controller/DrugConductController.dart';


class GoalConductTimeInformation extends StatelessWidget {
  DrugConductController controller;

  GoalConductTimeInformation(this.controller);

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 30.h),
            child: MissionTimeWidget(controller.goal.times!, context)),
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
