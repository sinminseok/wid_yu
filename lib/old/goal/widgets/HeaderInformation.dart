
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/old/goal/controller/OldGoalController.dart';

import '../../../common/utils/Color.dart';
import '../detail-view/OldGoalDetailView.dart';

class HeaderInformation extends StatelessWidget {
  OldGoalController controller;

  HeaderInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => OldGoalDetailView());
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30.w,top: 20.h),
              width: 210.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 36.h,
                    child: Title1Text(
                      "부모님 님",
                        kTextBlackColor
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3.h),
                    height: 30.h,
                    child: Row(
                      children: [
                        Title3Text(
                          "오늘은",
                            kTextBlackColor
                        ),
                        PercentageText(
                          " 75%",
                            wPurpleColor
                        ),
                        Title3Text(
                          "를 달성했어요.",
                            kTextBlackColor
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3.h),
                    height: 27.h,
                    child: Title3Text("차근차근 수행해 보아요!", wGrey500Color),
                  )
                ],
              ),
            ),
            _buildCircularProgress(),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 10.w, top: 17.h),
      width: 100.0.w,
      height: 120.0.h,
      child: CircularPercentIndicator(
        radius: 45.0,
        lineWidth: 6.0,
        percent: 0.7,
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: wGrey200Color,
        center: _buildCircularProgressCenter(),
        progressColor: wOrangeColor,
      ),
    );
  }

  Widget _buildCircularProgressCenter() {
    return Stack(
      children: [
        Container(
          width: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: wWhiteColor,
            border: Border.all(color: wGrey200Color)
          ),
        ),
        Positioned(
          height: 90.h,
          left: 2.w,
          child: Image.asset(
              height: 66.h,
              width: 66.h,
              "assets/images/user/old-man-goal.png"),
        ),
      ],
    );
  }

}
