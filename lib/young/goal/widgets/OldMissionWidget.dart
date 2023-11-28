import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/common-widget/mission/MissionGroupWidget.dart';

import '../../../common/common-widget/mission/MissionWidget.dart';
import '../../../common/model/mission/Mission.dart';
import '../../../common/model/mission/MissionType.dart';
import '../../../common/utils/Color.dart';

/*
 보호자가 목표 화면에서 볼 보호자 미션
 */
class OldMissionWidget extends StatefulWidget {


  @override
  _OldMissionWidgetState createState() => _OldMissionWidgetState();
}

class _OldMissionWidgetState extends State<OldMissionWidget> {
  bool _isExpanded = true;
  final List<Mission> items = [
    Mission("위염약", "~~복용하세요", MissionType.DRUG),
    Mission("런닝", "~~복용하세요", MissionType.WALK),
    Mission("독서", "~~복용하세요", MissionType.COMMON),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 30.h),
      width: 330.w,
      decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          color: wWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          _buildOldInformation(),
          _isExpanded == true
              ? Container(
                  width: 280.w,
                  height: 1.h,
                  color: kLightGreyColor,
                )
              : Container(),
          _isExpanded == true ? _buildOldMissions() : Container()
        ],
      ),
    );
  }

  Widget _buildOldInformation() {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        height: 97.0.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 15.h),
              width: 70.0.w, // Container의 너비
               // Container의 높이
              child: Container(
                child: CircularPercentIndicator(
                  radius: 34.0,
                  // 부모 컨테이너의 크기에 맞게 조절
                  lineWidth: 6.0,
                  percent: 0.7,
                  center: Container(
                    height: 49.h,
                    width: 49.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: wGrey100Color,

                    ),
                    child: Image.asset("assets/common/user/old-man-circle.png"),
                  ),
                  progressColor: wOrangeColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h, left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "부모님2님",
                      style: TextStyle(
                          color: kTextBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "오늘은 ",
                            style: TextStyle(
                                color: kTextBlackColor, fontSize: 16.sp),
                          ),
                        ),
                        Container(
                          child: Text(
                            "40%",
                            style: TextStyle(
                                color: wPurpleColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 18.sp),
                          ),
                        ),
                        Container(
                          child: Text(
                            " 를 달성했어요.",
                            style: TextStyle(
                                color: kTextBlackColor, fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 33.h, left: 10.w),
              child: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOldMissions() {
    return Container(
      width: 335.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: _buildMissionWidgets(),
        ),
      ),
    );
  }

  List<Widget> _buildMissionWidgets() {
    List<Widget> missionWidgets = [];

    for (int index = 0; index < items.length; index++) {
      missionWidgets.add(MissionWidget(items[index], false));

      if (index < items.length - 1) {
        missionWidgets.add(
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 340,
            height: 1,
            color: kLightGreyColor,
          ),
        );
      } else {
        missionWidgets.add(Container(
          height: 15.h,
        ));
      }
    }

    return missionWidgets;
  }
}
