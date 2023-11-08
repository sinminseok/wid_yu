import 'package:common/model/mission/Mission.dart';
import 'package:common/model/mission/MissionTime.dart';
import 'package:common/model/mission/MissionType.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MissionTimeWidget.dart';

class MissionWidget extends StatefulWidget {
  final Mission _mission;

  MissionWidget(this._mission);

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

    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          Container(
            width: 335.w,
            margin: EdgeInsets.only(left: 20.w, top: 25.h),
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
                              child: widget._mission.missionType==MissionType.DRUG?Image.asset("assets/images/icon/mission/drug.png"): widget._mission.missionType==MissionType.WALK?Image.asset("assets/images/icon/mission/run.png"):Image.asset("assets/images/icon/mission/common.png")
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
    );
  }
}
