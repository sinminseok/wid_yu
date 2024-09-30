import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/goal/main/controller/YoungGoalController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../utils/ConvertPercentage.dart';
import '../../goal-detail/view/YoungGoalDetailView.dart';

class HeaderInformation extends StatelessWidget {
  YoungGoalController controller;

  HeaderInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => YoungGoalDetailView(
                controller.totalInformation, controller.todayMyGoal),
            transition: Transition.fadeIn);
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
                      child: Title1Text("${controller.totalInformation.name}",
                          kTextBlackColor)),
                  _buildUserEmptyPercentageText(),
                ],
              ),
            ),
            _buildCircularProgress(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserEmptyPercentageText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30.h,
          margin: EdgeInsets.only(top: 13.h),
          child: Row(
            children: [
              Title3Text("오늘은 ", kTextBlackColor),
              PercentageText(
                //controller.totalInformation.percentage
                  "${ConvertPercentage().toPercentage(controller.totalInformation.percentage!)}%", wPurpleColor),
              Title3Text("를 달성 했어요.", kTextBlackColor),
            ],
          ),
        ),
        Container(
          height: 27.h,
          margin: EdgeInsets.only(top: 9.h),
          child: Title3Text("조금만 더 하면 목표 달성!", wGrey500Color),
        )
      ],
    );
  }

  Widget _buildUserPercentageText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 15.w, top: 20.h),
      width: 110.0.w,
      height: 110.0.h,
      child: CircularPercentIndicator(
        radius: 40.0.w,
        lineWidth: 6.0.sp,
        percent: controller.totalInformation.percentage!,
        backgroundColor: wGrey200Color,
        circularStrokeCap: CircularStrokeCap.round,
        center: Container(
          margin: EdgeInsets.only(top: 0.h),
          decoration: BoxDecoration(
            border: Border.all(color: wGrey100Color),
            shape: BoxShape.circle,
            color: wWhiteColor,
          ),
          height: 83.h,
          width: 83.h, // 원형을 만들기 위해 width와 height를 동일하게 설정
          clipBehavior: Clip.hardEdge, // 내용이 Container의 경계를 넘지 않도록 설정
          child: controller.totalInformation.profileImageUrl == null
              ? Image.asset(
            "assets/common/user/youngMan.png",
            fit: BoxFit.cover, // 이미지를 Container에 맞게 조정
          )
              : ClipOval(
            child: Image.network(
              controller.totalInformation.profileImageUrl!,
              fit: BoxFit.cover, // 이미지를 원에 맞게 조정
              width: 83.h,
              height: 83.h,
            ),
          ),
        ),
        progressColor: wOrangeColor,
      ),
    );
  }

}
