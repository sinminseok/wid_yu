
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/mission/Mission.dart';
import '../../model/mission/MissionTime.dart';
import '../../model/mission/TimeType.dart';
import '../../utils/CustomText.dart';
import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class WalkMissionWidget extends StatelessWidget {
  final Mission _mission;

  WalkMissionWidget(this._mission);

  List<MissionTime> times = [MissionTime("12:00", TimeType.NONE)];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 26.h,right: 20.w, left: 20.w),
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
            _buildTime(context),

          ],
        ),
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 50.w, top: 10.h, bottom: 20.h),
        child: MissionTimeWidget(times, context));
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
    return   Center(
      child: Container(
        margin: EdgeInsets.only(top: 3.h),

        child: Image.asset(
          width: 55.w,
          height: 55.h,
          "assets/images/mission/walk-mission-icon.png",fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildMissionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w,top: 6.h),
          child: Title3Text(
            _mission.title,
              wTextBlackColor
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 5.h),
          child: Body2Text(
            _mission.subtitle,
              wGrey800Color
          ),
        )
      ],
    );
  }

}

