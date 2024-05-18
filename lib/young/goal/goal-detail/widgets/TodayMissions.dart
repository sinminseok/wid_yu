

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/common/dto/goal/GoalType.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/young/goal/goal-detail/controller/YoungGoalDetailController.dart';

import '../../../../common/common-widget/mission-detail/CommonMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/DrugMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/WalkMissionWidget.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';

class TodayMission extends StatelessWidget {
  YoungGoalDetailController _controller;


  TodayMission(this._controller);

  // final List<GoalResponse> items = [
  //   GoalResponse(goalIdx: 1, title: "12", description: "312", type: GoalType.MEDICATION.toString(), day: "1111111", times: []),
  //   GoalResponse(goalIdx: 1,  title: "12", description: "312", type: GoalType.MEDICATION.toString(), day: "1111111", times: []),
  //   GoalResponse(goalIdx: 1,  title: "12", description: "312", type: GoalType.MEDICATION.toString(), day: "1111111", times: []),
  // ];


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
        DrugMissionWidget(_controller.toDrugGoals()),
        //WalkMissionWidget(items[0]),
        //CommonMissionWidget(items[0]),
      ],
    );
  }

  Widget _buildMissionDate() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
      width: 130.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubTitle2Text("2023.09.23",
              wGrey800Color),
          SubTitle2Text("수요일",
              wGrey800Color),
        ],
      ),
    );
  }
}
