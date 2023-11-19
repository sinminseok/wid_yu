import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'MissionGroupContainWidget.dart';

class OldMissionWidget extends StatefulWidget {
  const OldMissionWidget({Key? key}) : super(key: key);

  @override
  _OldMissionWidgetState createState() => _OldMissionWidgetState();
}

class _OldMissionWidgetState extends State<OldMissionWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 30.h),
      width: 330.w,
      decoration: BoxDecoration(
          border: Border.all(color: kTextGreyColor, width: 0.1.w),
          color: kTextWhiteColor,
          borderRadius:  BorderRadius.all(Radius.circular(10))),
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
          _isExpanded == true
              ? _buildOldMissions()
              : Container()
        ],
      ),
    );
  }

  Widget _buildOldInformation(){
    return InkWell(
      onTap: (){
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w, top: 15.h, bottom: 10.h),
              width: 80.0.w, // Container의 너비
              height: 80.0.h, // Container의 높이
              child: Container(
                margin: EdgeInsets.only(left: 5.w, top: 5.h),
                child: CircularPercentIndicator(
                  radius: 34.0,
                  // 부모 컨테이너의 크기에 맞게 조절
                  lineWidth: 5.0,
                  percent: 0.7,
                  center: Stack(
                    children: [
                      Container(
                        width: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kTextWhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // 그림자 색상
                              offset: Offset(0, 1), // 그림자 위치 (가로, 세로)
                              blurRadius: 2.0, // 그림자 흐림 정도
                              spreadRadius: 0.0, // 그림자 퍼짐 정도
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.h, left: 2.w),
                        height: 45.h,
                        child: Image.asset("assets/common/user/oldMan.png"),
                      ),
                    ],
                  ),
                  progressColor: wOrangeColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 23.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "부모님2님",
                      style: TextStyle(
                          color: kTextBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "오늘은 .",
                          style: TextStyle(
                              color: kTextBlackColor, fontSize: 18.sp),
                        ),
                      ),
                      Container(
                        child: Text(
                          "40%",
                          style: TextStyle(
                              color: wPurpleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                      Container(
                        child: Text(
                          " 를 달성했어요.",
                          style: TextStyle(
                              color: kTextBlackColor, fontSize: 18.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
           Container(
                margin: EdgeInsets.only(top: 33.h, left: 13.w),
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

  Widget _buildOldMissions(){
    return MissionGroupContainWidget();
  }
}
