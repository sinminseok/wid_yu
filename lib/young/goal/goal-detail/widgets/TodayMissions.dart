

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/goal/goal-detail/controller/YoungGoalDetailController.dart';

import '../../../../common/common-widget/mission-detail/CommonMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/DrugMissionWidget.dart';
import '../../../../common/common-widget/mission-detail/WalkMissionWidget.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';

class TodayMission extends StatelessWidget {
  YoungGoalDetailController _controller;


  TodayMission(this._controller);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //_buildMissionDate(),
        _buildTodayMission(),
      ],
    );
  }

  Widget _buildTodayMission() {
    return Column(
      children: [
        SizedBox(height: 30.h,),
        DrugMissionWidget(_controller.toDrugGoals()),
        WalkMissionWidget(_controller.toWaolGoals()),
        CommonMissionWidget(_controller.toCommonGoals()),
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
