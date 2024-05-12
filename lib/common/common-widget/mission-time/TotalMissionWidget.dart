import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';

import '../../utils/Color.dart';
import 'DoneMissionTimeWidget.dart';
import 'NoneMissionTimeWidget.dart';
import 'YetMissionTimeWidget.dart';

Widget TotalMissionTimeWidget(List<GoalTimeResponse> times, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10.w, top: 0.h),
    width: 200.w,
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (1.4.sp / 0.6.sp),

        crossAxisCount: 3, // 가로에 2개의 열을 배치합니다
        mainAxisSpacing: 10.0, // 아이템 사이의 간격을 설정합니다
        crossAxisSpacing: 7.0, // 열 사이의 간격을 설정합니다
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        return _buildTotalTime(times[index]);
      },
    ),
  );
}

Widget _buildTotalTime(GoalTimeResponse time) {
  return Container(
    width: 70.w,
    height: 30.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: wGrey500Color)),
    child: Center(
      child: ChipText("${time.time}", wGrey500Color),
    ),
  );
}

Widget _buildFilterTime(GoalTimeResponse missionTime) {
  if (missionTime.status == GoalTimeStatus.DONE) {
    return DoneMissionTimeWidget(missionTime.time);
  }
  if (missionTime.status == GoalTimeStatus.NONE) {
    return NoneMissionTimeWidget(missionTime.time);
  }
  if (missionTime.status == null) {
    return Container();
  }
  return YetMissionTimeWidget(missionTime.time);
}
