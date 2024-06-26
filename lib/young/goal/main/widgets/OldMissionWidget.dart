import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/OldResponseByYoung.dart';
import 'package:wid_yu/young/goal/main/controller/YoungGoalController.dart';

import '../../../../common/common-widget/mission/MissionWidget.dart';
import '../../../../common/dto/goal/GoalTime.dart';
import '../../../../common/dto/goal/GoalTimeStatus.dart';
import '../../../../common/dto/goal/GoalType.dart';
import '../../../../common/utils/Color.dart';
import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';

/*
 보호자가 목표 화면에서 볼 보호자 미션
 */
class OldMissionWidget extends StatefulWidget {
  OldResponseByYoung old;

  OldMissionWidget(this.old);

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
        height: 105.0.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //위염약
              //한번에 2개씩 복용하세요
              margin: EdgeInsets.only(left: 10.w, top: 15.h),
              width: 70.0.w, // Container의 너비
              // Container의 높이
              child: Container(
                child: CircularPercentIndicator(
                  radius: 28.0.w,
                  backgroundColor: wGrey200Color,
                  circularStrokeCap: CircularStrokeCap.round,
                  // 부모 컨테이너의 크기에 맞게 조절
                  lineWidth: 5.0.w,
                  percent: widget.old.percentage!,
                  center: Container(
                      height: 49.h,
                      width: 49.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: wGrey100Color,
                      ),
                      child: widget.old.profile == null
                          ? Image.asset("assets/common/user/old-man-circle.png")
                          : Image.network(widget.old.profile!)),
                  progressColor: wOrangeColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Title2Text("${widget.old.name}", kTextBlackColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Row(
                      children: [
                        Container(
                          child: Title3Text("오늘은 ", kTextBlackColor),
                        ),
                        Container(
                          child: Title3Text(
                              "${widget.old.percentage!}%", wPurpleColor),
                        ),
                        Container(
                          child: Title3Text(" 를 달성했어요.", kTextBlackColor),
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

    for (int index = 0; index < widget.old.goalsAndStatus!.length; index++) {
      missionWidgets
          .add(MissionWidget(false, widget.old.goalsAndStatus![index]));

      if (index < widget.old.goalsAndStatus!.length - 1) {
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
