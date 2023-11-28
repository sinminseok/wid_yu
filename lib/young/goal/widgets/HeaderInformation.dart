
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/utils/Color.dart';
import '../detail-view/YoungGoalDetailView.dart';

Widget HeaderInformation(){
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
            margin: EdgeInsets.only(left: 20.w, top: 15.h),
            width: 210.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "보호자님",
                  style: TextStyle(
                    color: kTextBlackColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Text(
                        "오늘은",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        " 75%",
                        style: TextStyle(
                          color: wPurpleColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "를 달성했어요.",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text(
                    "조금만 더 하면 목표 달성!",
                    style: TextStyle(
                        color: wGrey500Color,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
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
    margin: EdgeInsets.only(right: 20.w, top: 17.h),
    width: 100.0.w,
    height: 100.0.h,
    child: CircularPercentIndicator(
      radius: 40.0,
      lineWidth: 5.0,
      percent: 0.7,
      center: Container(
        margin: EdgeInsets.only(top: 0.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: wWhiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              offset: Offset(0.0, 0.3),
            ),
          ],
        ),
        height: 65.h,
        child: Image.asset("assets/common/user/youngMan.png"),
      ),
      progressColor: wOrangeColor,
    ),
  );
}