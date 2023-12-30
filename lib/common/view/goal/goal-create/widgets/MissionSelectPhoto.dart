import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/view/goal/goal-create/controller/GoalCreateController.dart';

import '../../../../utils/Color.dart';

class MissionSelectPhoto extends StatelessWidget {

  GoalCreateController controller;


  MissionSelectPhoto(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.drug?Container(
      margin: EdgeInsets.only(top: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: SubTitle2Text("약복용 사진찍기", wTextBlackColor),
          ),
          _buildSwitch()
        ],
      ),
    ):Container());
  }

  Widget _buildSwitch() {
    return Container(
      margin: EdgeInsets.only(right: 25.w, top: 10.h),
      child: FlutterSwitch(
        width: 70.0.w,
        height: 45.0.h,
        showOnOff: true,
        valueFontSize: 13.sp,
        toggleSize: 30.0,
        borderRadius: 40,
        value: controller.switchValue,
        onToggle: (value) {
          controller.clickSwitch(value);
        },
        activeColor: wTextBlackColor,
        inactiveColor: wOrangeColor,
        toggleColor: Colors.white,
        activeTextColor: wWhiteColor,

        inactiveTextColor: wWhiteColor,
        activeText: "끔",
        inactiveText: "켬",

      ),
    );
  }
}
