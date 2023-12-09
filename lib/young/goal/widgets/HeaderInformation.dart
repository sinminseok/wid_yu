import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../../../common/utils/Color.dart';
import '../detail-view/YoungGoalDetailView.dart';

Widget HeaderInformation() {
  return InkWell(
    onTap: () {
      Get.to(() => YoungGoalDetailView(), transition: Transition.fadeIn);
    },
    child: Container(
      margin: EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.w, top: 15.h),
            width: 210.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 36.h,
                    child: Title1Text("보호자님", kTextBlackColor)),
                Container(
                  height: 30.h,
                  margin: EdgeInsets.only(top: 3.h),
                  child: Row(
                    children: [
                      Title3Text("오늘은", kTextBlackColor),
                      PercentageText(
                        " 75%",
                        wPurpleColor,
                      ),
                      Title3Text("를 달성했어요.", kTextBlackColor),
                    ],
                  ),
                ),
                Container(
                  height: 27.h,
                  margin: EdgeInsets.only(top: 3.h),
                  child: Title3Text("조금만 더 하면 목표 달성!", wGrey500Color),
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
    margin: EdgeInsets.only(right: 15.w, top: 10.h),
    width: 100.0.w,
    height: 100.0.h,
    child: CircularPercentIndicator(
      radius: 40.0,
      lineWidth: 5.0,
      percent: 0.7,
      backgroundColor: wGrey200Color,
      circularStrokeCap: CircularStrokeCap.round,
      center: Container(
        margin: EdgeInsets.only(top: 0.h),
        decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          shape: BoxShape.circle,
          color: wWhiteColor,

        ),
        height: 65.h,
        child: Image.asset("assets/common/user/youngMan.png"),
      ),
      progressColor: wOrangeColor,
    ),
  );
}
