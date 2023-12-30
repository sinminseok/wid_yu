import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/view/goal/goal-create/GoalCreateView.dart';

Container OldGoalFloatingButton() {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    child: ConstrainedBox(

      constraints: BoxConstraints.tightFor(width: 110, height: 44),
      child:  FloatingActionButton(

        onPressed: () {
          Get.to(() => GoalCreateView(false), transition: Transition.fadeIn);
        },
        child: Row(
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
      ),
    ),
  );
}

