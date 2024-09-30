import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/OldResponseByYoung.dart';

import '../../../../common/common-widget/mission/MissionWidget.dart';
import '../../../../common/utils/Color.dart';
import '../../../../utils/ConvertPercentage.dart';

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
              child:       Container(
                margin: EdgeInsets.only(left: 15.w, top: 0.h, bottom: 10.h),
                width: 85.0.h, // Container의 너비
                height: 85.0.h, // Container의 높이
                child: Container(
                  margin: EdgeInsets.only(left: 5.w, top: 5.h),
                  child: CircularPercentIndicator(
                    radius: 28.0.w,
                    backgroundColor: wGrey200Color,
                    circularStrokeCap: CircularStrokeCap.round,
                    lineWidth: 5.0,
                    percent: widget.old.percentage!,
                    center: Container(
                      height: 55.h,
                      width: 55.h,
                      decoration: BoxDecoration(
                          color: wGrey100Color, shape: BoxShape.circle),
                      child: widget.old.profile == null
                          ? Image.asset(
                          "assets/common/user/old-man-circle.png")
                          : ClipOval(
                        child: Image.network(
                          widget.old.profile!,
                          fit: BoxFit.cover, // 이미지를 원에 맞게 조정
                          width: 55.h,
                          height: 55.h,
                        ),
                      ),
                    ),
                    progressColor: wOrangeColor,
                  ),
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
                              "${ConvertPercentage().toPercentage(widget.old.percentage!)}%", wPurpleColor),
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
      if(widget.old.goalsAndStatus![0].goalIdx != 0) {
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

    }

    return missionWidgets;
  }
}
