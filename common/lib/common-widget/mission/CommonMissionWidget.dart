

import 'package:common/common-widget/mission/mission-time/MissionTimeWidget.dart';
import 'package:common/model/mission/MissionTime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/mission/Mission.dart';
import '../../utils/Color.dart';

class CommonMissionWidget extends StatelessWidget {
  final Mission _mission;

  CommonMissionWidget(this._mission);


  List<MissionTime> times = [MissionTime("12:00")];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kLightGreyColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            _buildMissionInfo(),
            _buildTime(context),

          ],
        ),
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    return MissionTimeWidget(times, context);
  }

  Widget _buildNotReady() {
    return Container(
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Text("아직 기능 개발중 입니다..", style: TextStyle(color: Colors.grey),)),
      ),
    );
  }

  Widget _buildMissionInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w),
      child: Row(
        children: [
          _buildMissionIcon(),
          _buildMissionDetails(),

        ],
      ),
    );
  }

  Widget _buildMissionIcon() {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 28.w,
          height: 28.h,
          child: Image.asset("assets/common/icon/mission/common.png"),
        ),
      ),
    );
  }

  Widget _buildMissionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Text(
            _mission.title,
            style: TextStyle(
              color: kTextBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 5.h),
          child: Text(
            _mission.subtitle,
            style: TextStyle(
              color: kTextBlackColor,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }

}

