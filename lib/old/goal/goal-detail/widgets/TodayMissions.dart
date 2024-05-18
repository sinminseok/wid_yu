
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/old/goal/goal-detail/controller/OldGoalDetailController.dart';

import '../../../../common/common-widget/mission-detail/CommonMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/DrugMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/WalkMissionWidget.dart';
import '../../../../common/dto/goal/GoalType.dart';
import '../../../../common/utils/Color.dart';

class TodayMissions extends StatelessWidget {

  OldGoalDetailController controller;


  TodayMissions(this.controller);

  final List<GoalResponse> items = [
    GoalResponse(goalIdx: 1, title: "title", description: "asd", type: GoalType.MEDICATION.toString(), day: "1111111", times: []),
    GoalResponse(goalIdx: 1,  title: "title", description: "asd", type: GoalType.MEDICATION.toString(), day: "1111111", times: []),
    GoalResponse(goalIdx: 1,title: "title", description: "asd", type: GoalType.MEDICATION.toString(), day: "1111111", times: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMissionDate(),
        _buildTodayMission(),
      ],
    );
  }

  Widget _buildTodayMission() {
    return Column(
      children: [
        //DrugMissionWidget(items[1]),
        //WalkMissionWidget(items[2]),
        //CommonMissionWidget(items[2]),
      ],
    );
  }

  Widget _buildMissionDate() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 48.h, bottom: 10.h),
      width: 140.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("2023.09.23",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp)),
          Text("수요일",
              style: TextStyle(color: kTextBlackColor, fontSize: 15.sp)),
        ],
      ),
    );
  }
}
