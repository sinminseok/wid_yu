
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/mission-time/DoneMissionTimeWidget.dart';
import 'package:wid_yu/common/common-widget/mission-time/NoneMissionTimeWidget.dart';
import 'package:wid_yu/common/common-widget/mission-time/YetMissionTimeWidget.dart';
import 'package:wid_yu/common/model/mission/TimeType.dart';

import '../../model/mission/MissionTime.dart';
import '../../utils/Color.dart';

/*
메인 화면에서 보여줄 미션 시간 위젯
 */
Widget MissionTimeWidget(List<MissionTime> times, BuildContext context){
  return times.length == 1 ?_buildOnlyOneTime(times[0]):

  Container(
    margin: EdgeInsets.only(left: 0.w,top: 10.h),
    width: 250.w,
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (1 / .2),

        crossAxisCount: 2, // 가로에 2개의 열을 배치합니다
        mainAxisSpacing: 10.0, // 아이템 사이의 간격을 설정합니다
        crossAxisSpacing: 10.0, // 열 사이의 간격을 설정합니다
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        return _buildFilterTime(times[index]);
      },
    ),
  );
}

/*
미션 시간이 하나일때 빌드하는 위젯이다.
내부에 동작하는 위젯을 분리할지는 좀 더 고민해보자.
 */
Widget _buildOnlyOneTime(MissionTime missionTime){
  if(missionTime.timeType == TimeType.DONE){
    return Container(
      width: 250.w,
      height: 30.h,
      decoration: BoxDecoration(
          color: wOrangeColor,
          border: Border.all(color: wOrange200Color),
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Text("${missionTime.time}", style: TextStyle(color: wWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600),)),
              Container(
                margin: EdgeInsets.only(left: 3.w),
                child: Icon(Icons.check, color: wWhiteColor,),
              )
            ],
          )
      ),
    );
  }
  if(missionTime.timeType == TimeType.NONE){
    return Container(
      width: 250.w,
      height: 30.h,
      decoration: BoxDecoration(
          color: wGrey200Color,
          border: Border.all(color: wGrey300Color),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
        child: Text(
          "${missionTime.time}",
          style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: wWhiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
  if(missionTime.timeType == null){
    return Container();
  }
  return Container(
    width: 250.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border.all(color: wGrey500Color),
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: Text(
        "${missionTime.time}",
        style: TextStyle(
            color: wGrey500Color,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget _buildFilterTime(MissionTime missionTime){
  if(missionTime.timeType == TimeType.DONE){
    return DoneMissionTimeWidget(missionTime.time);
  }
  if(missionTime.timeType == TimeType.NONE){
    return NoneMissionTimeWidget(missionTime.time);
  }
  if(missionTime.timeType == null){
    return Container();
  }
  return YetMissionTimeWidget(missionTime.time);
}