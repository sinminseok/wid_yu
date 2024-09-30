import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/goal/main/controller/OldGoalController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../utils/ConvertPercentage.dart';
import '../../goal-detail/view/OldGoalDetailView.dart';

class HeaderInformation extends StatelessWidget {
  OldGoalController controller;

  HeaderInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => OldGoalDetailView(controller.user!,controller.todayGoals!));
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30.w, top: 20.h),
              width: 210.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 36.h,
                    child: Title1Text("${controller.user!.name} 님", kTextBlackColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13.h),
                    height: 30.h,
                    child: Row(
                      children: [
                        Title3Text("오늘은", kTextBlackColor),
                        PercentageText(" ${ConvertPercentage().toPercentage(controller.user!.percentage!)}%", wPurpleColor),
                        Title3Text("를 달성했어요.", kTextBlackColor),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
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
      margin: EdgeInsets.only(right: 20.w, top: 25.h),
      width: 100.0.w,
      height: 110.0.h,
      child: CircularPercentIndicator(
        radius: 40.0.w,
        lineWidth: 6.0.sp,
        percent: controller.user!.percentage,
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
        controller.user!.profileImageUrl == null? Container(
          width: 83.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: wWhiteColor,
              border: Border.all(color: wGrey200Color)),
          child: Center(
            child: Image.asset("assets/images/user/old-man-goal.png"),
          ),
        ):ClipOval(
          child: Image.network(
            controller.user!.profileImageUrl!,
            fit: BoxFit.cover, // 이미지를 원에 맞게 조정
            width: 83.h,
            height: 83.h,
          ),
        ),
      ],
    );
  }
}
