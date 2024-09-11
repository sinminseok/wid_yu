import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/mission-time/DoneMissionTimeWidget.dart';
import 'package:wid_yu/common/common-widget/mission-time/NoneMissionTimeWidget.dart';
import 'package:wid_yu/common/common-widget/mission-time/YetMissionTimeWidget.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import '../../dto/goal/GoalTimeStatus.dart';
import '../../utils/Color.dart';

/*
메인 화면에서 보여줄 미션 시간 위젯
 */
Widget MissionTimeWidget(List<GoalTimeResponse> times, BuildContext context) {
  return times.length == 0
      ? Container()
      : Container(
          margin: EdgeInsets.only(left: 0.w, top: 10.h),
          width: 240.w,
          child: SingleChildScrollView(
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (1 / 0.27),

                crossAxisCount: 2, // 가로에 2개의 열을 배치합니다
                mainAxisSpacing: 10.0, // 아이템 사이의 간격을 설정합니다
                crossAxisSpacing: 10.0, // 열 사이의 간격을 설정합니다
              ),
              itemCount: times.length,
              itemBuilder: (context, index) {
                return _buildFilterTime(times[index]);
              },
            ),
          ),
        );
}

/*
미션 시간이 하나일때 빌드하는 위젯이다.
내부에 동작하는 위젯을 분리할지는 좀 더 고민해보자.
 */
Widget _buildOnlyOneTime(GoalTimeResponse missionTime) {
  if (missionTime.status == GoalTimeStatus.DONE) {
    return Container(
      width: 250.w,
      height: 34.h,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: wOrangeColor,
          border: Border.all(color: wOrange200Color),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(left: 0.w),
              child: Text(
                "${missionTime.time}",
                style: TextStyle(
                    color: wWhiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              )),
          Container(
              width: 13.w,
              height: 9.5.h,
              margin: EdgeInsets.only(left: 3.w),
              child: Image.asset("assets/images/icon/check-icon.png"))
        ],
      )),
    );
  }
  if (missionTime.status == GoalTimeStatus.NONE) {
    return Container(
      width: 240.w,
      height: 30.h,
      margin: EdgeInsets.only(left: 30.w, right: 16.w),
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
              fontFamily: "chip",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
  if (missionTime.status == null) {
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
            color: wGrey500Color, fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget _buildFilterTime(GoalTimeResponse missionTime) {
  // if (missionTime.status == true) {
  //   // 성공
  //   return DoneMissionTimeWidget(missionTime.time);
  // }
  if(missionTime.status == -1){
    //실패
    return NoneMissionTimeWidget(missionTime.time);
  }
  if(missionTime.status == 1){
    return DoneMissionTimeWidget(missionTime.time);
  }
  return YetMissionTimeWidget(missionTime.time);
}
