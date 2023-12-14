import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/goal/controller/YoungGoalController.dart';

import '../../../common/utils/Color.dart';
import '../../../common/view/goal/goal-create/GoalCreateView.dart';

class YoungGoalFloatinButton extends StatefulWidget {
  final YoungGoalController controller;

  YoungGoalFloatinButton({required this.controller});

  @override
  State<YoungGoalFloatinButton> createState() => _YoungGoalFloatinButtonState();
}

class _YoungGoalFloatinButtonState extends State<YoungGoalFloatinButton> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 105.w,
                height: 43.h,
                margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
                child: _buildExtendButton()),
            widget.controller.olds.value.length == 0
                ? Container()
                : widget.controller.isBottomScroll == false
                    ? Container(child: _buildFloatingOldInformation())
                    : Container()
          ],
        ));
  }

  FloatingActionButton _buildExtendButton() {
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

  Widget _buildFloatingOldInformation() {
    return InkWell(
      onTap: () {
        widget.controller.goDetailYoungMissions();
      },
      child: Container(
        width: 360.w,
        height: 120.h,
        margin: EdgeInsets.only(top:20.h, bottom: 0.h),
        decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w, top: 0.h, bottom: 10.h),
                  width: 70.0.w, // Container의 너비
                  height: 85.0.h, // Container의 높이
                  child: Container(
                    margin: EdgeInsets.only(left: 5.w, top: 5.h),
                    child: CircularPercentIndicator(
                      radius: 34.0,
                      backgroundColor: wGrey200Color,
                      circularStrokeCap: CircularStrokeCap.round,
                      lineWidth: 5.0,
                      percent: 0.7,
                      center: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: wGrey100Color, shape: BoxShape.circle),
                        child: Image.asset(
                            "assets/common/user/old-man-circle.png"),
                      ),
                      progressColor: wOrangeColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "부모님2님",
                          style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "오늘은 ",
                              style: TextStyle(
                                  color: kTextBlackColor, fontSize: 16.sp),
                            ),
                          ),
                          Container(
                            child: Text(
                              "40%",
                              style: TextStyle(
                                  color: wPurpleColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp),
                            ),
                          ),
                          Container(
                            child: Text(
                              " 를 달성했어요.",
                              style: TextStyle(
                                  color: kTextBlackColor, fontSize: 16.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 45.h, right: 18.w),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
