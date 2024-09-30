import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/young-dto/response/user/OldResponseByYoung.dart';
import 'package:wid_yu/young/goal/main/controller/YoungGoalController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../utils/ConvertPercentage.dart';
import '../../goal-create/view/YoungGoalCreateView.dart';

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
            _buildExtendButton(),
            widget.controller.totalInformation.seniorsGoalList?.length == 0
                ? Container()
                : widget.controller.isBottomScroll == false
                    ? Container(
                        child: _buildFloatingOldInformation(widget
                            .controller.totalInformation.seniorsGoalList![0]))
                    : Container()
          ],
        ));
  }

  Container _buildExtendButton() {
    return Container(
      margin: EdgeInsets.only(right: 22.w),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 110, height: 44),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => YoungGoalCreateView(), transition: Transition.fadeIn);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.add,
                  size: 17.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.w),
                child: ButtonText(" 목표생성", wWhiteColor),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          foregroundColor: Colors.white,
          backgroundColor: wPurpleColor,
        ),
      ),
    );
  }

  Widget _buildFloatingOldInformation(OldResponseByYoung old) {
    return InkWell(
      onTap: () {
        widget.controller.goDetailYoungMissions();
      },
      child: Container(
        width: 375.w,
        height: 115.h,
        margin: EdgeInsets.only(top: 20.h, bottom: 0.h),
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
                  width: 85.0.h, // Container의 너비
                  height: 85.0.h, // Container의 높이
                  child: Container(
                    margin: EdgeInsets.only(left: 5.w, top: 5.h),
                    child: CircularPercentIndicator(
                      radius: 28.0.w,
                      backgroundColor: wGrey200Color,
                      circularStrokeCap: CircularStrokeCap.round,
                      lineWidth: 5.0,
                      percent: old.percentage!,
                      center: Container(
                        height: 55.h,
                        width: 55.h,
                        decoration: BoxDecoration(
                            color: wGrey100Color, shape: BoxShape.circle),
                        child: old.profile == null
                            ? Image.asset(
                                "assets/common/user/old-man-circle.png")
                            : ClipOval(
                                child: Image.network(
                                  old.profile!,
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
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30.h,
                        child: Text(
                          "${old.name}",
                          style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        height: 30.h,
                        child: Row(
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
                                "${ConvertPercentage().toPercentage(old.percentage!)}%",
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
                        ),
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
