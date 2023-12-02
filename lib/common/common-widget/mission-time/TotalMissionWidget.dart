import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/mission/MissionTime.dart';
import '../../model/mission/TimeType.dart';
import '../../utils/Color.dart';
import 'DoneMissionTimeWidget.dart';
import 'NoneMissionTimeWidget.dart';
import 'YetMissionTimeWidget.dart';

Widget TotalMissionTimeWidget(List<MissionTime> times, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 25.w, top: 0.h),
    width: 200.w,
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (0.9 / 0.3),

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

Widget _buildTotalTime(MissionTime time) {
  return Container(
    width: 70.w,
    height: 30.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: wGrey500Color)),
  );
}

Widget _buildFilterTime(MissionTime missionTime) {
  if (missionTime.timeType == TimeType.DONE) {
    return DoneMissionTimeWidget(missionTime.time);
  }
  if (missionTime.timeType == TimeType.NONE) {
    return NoneMissionTimeWidget(missionTime.time);
  }
  if (missionTime.timeType == null) {
    return Container();
  }
  return YetMissionTimeWidget(missionTime.time);
}
