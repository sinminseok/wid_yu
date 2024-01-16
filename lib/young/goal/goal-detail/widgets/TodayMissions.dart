

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/common/dto/goal/GoalType.dart';

import '../../../../common/common-widget/mission-detail/CommonMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/DrugMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/WalkMissionWidget.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';

class TodayMission extends StatelessWidget {
   TodayMission({Key? key}) : super(key: key);

  final List<Goal> items = [
    Goal("위염약", "~~복용하세요", GoalType.DRUG,[GoalTime("12:00", GoalTimeStatus.DONE, null, null)],[1,1,1]),
    Goal("위염약", "~~복용하세요", GoalType.DRUG,[GoalTime("12:00", GoalTimeStatus.DONE, null, null)],[1,1,1]),
    Goal("위염약", "~~복용하세요", GoalType.DRUG,[GoalTime("12:00", GoalTimeStatus.DONE, null, null)],[1,1,1]),
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
        DrugMissionWidget(items[1]),
        WalkMissionWidget(items[2]),
        CommonMissionWidget(items[2]),
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
