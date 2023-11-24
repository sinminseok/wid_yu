
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/model/mission/Mission.dart';
import 'package:wid_yu/old/goal-conduct/popup/OldRetryMissionPopup.dart';
import 'package:wid_yu/common/common-widget/appbar/ConductAppbar.dart';

import '../../common/common-widget/mission-time/MissionTimeWidget.dart';
import '../../common/model/mission/MissionTime.dart';
import '../../common/model/mission/TimeType.dart';
import '../../common/utils/Color.dart';
import '../../common/utils/FilePath.dart';
import 'OldFinishCoundctView.dart';

class OldCommonConductView extends StatefulWidget {
  final Mission mission;


  OldCommonConductView(this.mission);

  @override
  _OldCommonConductViewState createState() => _OldCommonConductViewState();
}

class _OldCommonConductViewState extends State<OldCommonConductView> {
  List<MissionTime> times = [
    MissionTime("12:00", TimeType.DONE),
    MissionTime("13:00", TimeType.DONE),
    MissionTime("14:00", TimeType.NONE),
    MissionTime("15:00", TimeType.YET),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: ConductAppBar(widget.mission.title),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _buildTimeAndText(),
              //_buildTimes(),
              _buildDrugImage(),
            ],
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            OldRetryMissionPopup().showDialog(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Text(
              "다시알림",
              style: TextStyle(
                  color: wPurpleColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h,bottom: 20.h),
          width: 337.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {


                },
                child: Container(
                  width: 108.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: wGrey200Color,
                      border: Border.all(color: wGrey300Color),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Center(
                    child: Text(
                      "끄기",
                      style: TextStyle(
                          color: wGrey600Color,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: (OldFinishConductView(widget.mission))));
                },
                child: Container(
                  width: 221.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: wOrangeColor,
                      border: Border.all(color: wOrange200Color),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Center(
                    child: Text(
                      "수행하기",
                      style: TextStyle(
                          color: wWhiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTimes() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: MissionTimeWidget(times, context),
    );
  }

  Widget _buildDrugImage() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 200.w,
      height: 180.h,
      child: Image.asset(commonImagePath + "goal-conduct/flag.png"),
    );
  }

  Widget _buildTimeAndText() {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 50.h),
            child: Text(
              "20:00",
              style: TextStyle(
                  fontSize: 40.sp,
                  color: wGrey800Color,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text(
            "오늘도 열심히 수행해보아요!!",
            style: TextStyle(fontSize: 14.sp, color: wGrey800Color),
          ),
        )
      ],
    );
  }
}