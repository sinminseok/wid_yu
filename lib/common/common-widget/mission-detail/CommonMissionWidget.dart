import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';

import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class CommonMissionWidget extends StatefulWidget {
  final List<GoalResponse> _goals;

  CommonMissionWidget(this._goals);

  @override
  State<CommonMissionWidget> createState() => _CommonMissionWidgetState();
}

class _CommonMissionWidgetState extends State<CommonMissionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget._goals.map((e) => _buildCard(context, e)).toList(),
    );
  }

  Widget _buildCard(BuildContext context, GoalResponse goalResponse){
    return Center(
      child: Container(
        margin:
        EdgeInsets.only(top: 26.h, bottom: 10.h, right: 20.w, left: 20.w),
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kLightGreyColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            _buildMissionInfo(goalResponse),
            _buildTime(context, goalResponse),
          ],
        ),
      ),
    );
  }

  Widget _buildTime(BuildContext context, GoalResponse _mission) {
    return Container(
        margin: EdgeInsets.only(left: 50.w, top: 10.h, bottom: 20.h),
        child: MissionTimeWidget(_mission.times!, context));
  }

  Widget _buildMissionInfo(GoalResponse _mssion) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w),
      child: Row(
        children: [
          _buildMissionIcon(),
          _buildMissionDetails(_mssion),
        ],
      ),
    );
  }

  Widget _buildMissionIcon() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 3.h),
        child: Image.asset(
          width: 55.w,
          height: 55.h,
          "assets/images/mission/common-mission-icon.png",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildMissionDetails(GoalResponse _mission) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Title3Text(_mission.title!, kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 5.h),
          child: Body2Text(_mission.title!, wGrey800Color),
        )
      ],
    );
  }
}
