import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/old/goal-conduct/CommonConductView.dart';
import 'package:wid_yu/old/goal-conduct/DrugConductView.dart';
import 'package:wid_yu/old/goal-conduct/RunningConductView.dart';

import '../../model/mission/Mission.dart';
import '../../model/mission/MissionTime.dart';
import '../../model/mission/MissionType.dart';
import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class MissionWidget extends StatefulWidget {
  final Mission _mission;
  final bool isOld;

  MissionWidget(this._mission, this.isOld);

  @override
  _MissionWidgetState createState() => _MissionWidgetState();
}

class _MissionWidgetState extends State<MissionWidget> {

  List<MissionTime> times = [
    MissionTime("12:00"),
    MissionTime("13:00"),
    MissionTime("14:00"),
    MissionTime("14:00"),
  ];

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        //약일때
        if(widget._mission.missionType == MissionType.DRUG){
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: (DrugConductView(widget._mission))));
        }
        if(widget._mission.missionType == MissionType.WALK){
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: (RunningConductView(widget._mission))));
        }
        if(widget._mission.missionType == MissionType.COMMON){
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: (CommonConductView(widget._mission))));
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            Container(
              width: 335.w,
              margin: EdgeInsets.only(left: 20.w, top: 15.h),
              decoration: BoxDecoration(color: kTextWhiteColor),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
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
                                child: widget._mission.missionType==MissionType.DRUG?Image.asset("assets/common/icon/mission/drug.png"): widget._mission.missionType==MissionType.WALK?Image.asset("assets/common/icon/mission/run.png"):Image.asset("assets/common/icon/mission/common.png")
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h,left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: Text(
                                widget._mission.title,
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.w, top: 5.h),
                              child: Text(
                                widget._mission.subtitle,
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // times의 길이가 하나면 아래 코드를 사용하고 times의 길이가 2개 이상이면 gridview를 사용해 가로에 2열, 세로로 남은 요소들을 배치한다
            Container(
                margin: EdgeInsets.only(top: 5.h,left: 15.w),
                child: MissionTimeWidget(times, context)),

          ],
        ),
      ),
    );
  }
}
