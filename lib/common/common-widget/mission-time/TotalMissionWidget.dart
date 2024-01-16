import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../utils/Color.dart';
import 'DoneMissionTimeWidget.dart';
import 'NoneMissionTimeWidget.dart';
import 'YetMissionTimeWidget.dart';

Widget TotalMissionTimeWidget(List<GoalTime> times, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10.w, top: 0.h),
    width: 210.w,
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (0.8.sp / 0.4.sp),

        crossAxisCount: 3, // 가로에 2개의 열을 배치합니다
        mainAxisSpacing: 10.0, // 아이템 사이의 간격을 설정합니다
        crossAxisSpacing: 10.0, // 열 사이의 간격을 설정합니다
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        return _buildTotalTime(times[index]);
      },
    ),
  );
}

Widget _buildTotalTime(GoalTime time) {
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

Widget _buildFilterTime(GoalTime missionTime) {
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
