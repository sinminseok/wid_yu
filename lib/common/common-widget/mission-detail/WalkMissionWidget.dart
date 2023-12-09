
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/mission/Mission.dart';
import '../../text/CustomText.dart';
import '../../utils/Color.dart';

class WalkMissionWidget extends StatelessWidget {
  final Mission _mission;

  WalkMissionWidget(this._mission);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.h,right: 20.w, left: 20.w),
        width: 335.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kLightGreyColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            _buildMissionInfo(),
            _buildNotReady()

          ],
        ),
      ),
    );
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
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
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
          margin: EdgeInsets.only(top: 0.h),
          width: 38.w,
          height: 38.h,
          child: Image.asset("assets/images/common/mission/walk.png"),
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
          child: Title3Text(
            _mission.title,
              wTextBlackColor
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 5.h),
          child: Body2Text(
            _mission.subtitle,
              wGrey800Color
          ),
        )
      ],
    );
  }

}

