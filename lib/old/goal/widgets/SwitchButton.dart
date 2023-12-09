
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/old/goal/controller/OldGoalController.dart';

import '../../../common/utils/Color.dart';

class SwitchButton extends StatelessWidget {
  OldGoalController controller;


  SwitchButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(right: 250.w, top: 10.h,bottom: 9.h),
      child: FlutterSwitch(
        width: 70.0.w,
        height: 40.0.h,
        showOnOff: true,
        valueFontSize: 13.sp,
        toggleSize: 30.0,
        value: controller.switchValue,
        onToggle: (value) {
          controller.updateSwitchValue(value);
        },
        activeColor: wOrangeColor,
        inactiveColor: wPurple200Color,
        toggleColor: Colors.white,
        activeTextColor: wWhiteColor,
        inactiveTextColor: wWhiteColor,
        activeText: "전체",
        inactiveText: "오늘",
      ),
    ));
  }
}
