import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/controller/AddOldController.dart';

import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';

class AddSelectHaveDisease extends StatelessWidget {
  final AddOldController controller;

  AddSelectHaveDisease({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w),
        width: 360.w,
        height: 132.h,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 30.h,
                    margin: EdgeInsets.only(top: 10.h, left: 0.w),
                    child: Title2Text("부모님께서 보유한 질병이 있나요?", wGrey800Color)),
                Container(
                  margin: EdgeInsets.only(left: 0.w, top: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            controller.haveDisease();
                            controller.updateNextStepState();
                          },
                          child: Container(
                            width: 153.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: controller.isDisease == 1
                                    ? wPurpleColor
                                    : wGrey200Color,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: controller.isDisease == 1
                                  ? wPurpleColor
                                  : wGrey100Color,
                            ),
                            child: Center(
                                child: ButtonText(
                                    "있음",
                                    controller.isDisease == 1
                                        ? wWhiteColor
                                        : wGrey400Color)),
                          )),
                      InkWell(
                        onTap: () {
                          controller.haveNotDisease();
                          controller.updateNextStepState();
                        },
                        child: Container(
                          width: 153.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: controller.isDisease == -1
                                      ? wPurple200Color
                                      : wGrey200Color),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: controller.isDisease == -1
                                  ? wPurpleColor
                                  : wGrey100Color
                          ),
                          child: Center(
                              child: ButtonText(
                                  "없음",
                                  controller.isDisease == -1
                                      ? wWhiteColor
                                      : wGrey400Color)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
    ));
  }
}
