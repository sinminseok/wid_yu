import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/text/CustomText.dart';
import '../../../common/utils/Color.dart';
import '../../../common/view/goal/goal-create/GoalCreateView.dart';

FloatingActionButton OldGoalFloatingButton() {
  return FloatingActionButton.extended(
    onPressed: () {
      Get.to(() => GoalCreateView(false), transition: Transition.fadeIn);
    },
    label: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(Icons.add,size: 17.sp,),
        ),
        Container(
          margin: EdgeInsets.only(right: 0.w),
          child: ButtonText(
              " 목표생성",
              wWhiteColor
          ),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    foregroundColor: Colors.white,
    backgroundColor: wPurpleColor,
  );
}

