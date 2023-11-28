import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';

import '../../../../../common/utils/Color.dart';

class SelectHaveDisease extends StatelessWidget {
  final OldInformationController controller;

  SelectHaveDisease({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 360.w,
      height: 132.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 20.w),
            child: Text(
              "부모님께서 보유한 질병이 있나요?",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 17.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0.w, top: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      controller.haveDisease();
                    },
                    child: Container(
                      width: 157.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.isDisease == true
                              ? wPurpleColor
                              : wGrey200Color,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: controller.isDisease == true
                            ? wPurpleColor
                            : Colors.grey.shade200,
                      ),
                      child: Center(
                          child: Text(
                            "있음",
                            style: TextStyle(
                                color: controller.isDisease == true
                                    ? wWhiteColor
                                    : Colors.grey.shade600),
                          )),
                    )),
                InkWell(
                  onTap: () {
                    controller.haveNotDisease();
                  },
                  child: Container(
                    width: 157.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.isDisease == null
                              ? wGrey200Color
                              : controller.isDisease == false
                              ? wPurple200Color
                              : wGrey200Color),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: controller.isDisease == null
                          ? wGrey200Color
                          : controller.isDisease == false
                          ? wPurpleColor
                          : Colors.grey.shade200,
                    ),
                    child: Center(
                        child: Text(
                          "없음",
                          style: TextStyle(
                              color: controller.isDisease == false
                                  ? wWhiteColor
                                  : Colors.grey.shade600),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
