
import 'package:common/model/mission/MissionTime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget MissionTimeWidget(List<MissionTime> times, BuildContext context){
  double itemWidth = (MediaQuery.of(context).size.width - 40.w - 10.0) / 2;
  return    times.length == 1 ?Container(
    margin: EdgeInsets.only(top: 15.h, left: 30.w, bottom: 10.h),
    width: 250.w,
    height: 30.h,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Center(
      child: Text(
        "19:00",
        style: TextStyle(color: Colors.grey),
      ),
    ),
  ):

  Container(
    margin: EdgeInsets.only(left: 40.w,top: 10.h),
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
        return Container(
          width: itemWidth,
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              times[index].time,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    ),
  );
}