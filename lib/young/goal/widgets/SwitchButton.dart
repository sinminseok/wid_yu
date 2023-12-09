import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/goal/controller/YoungGoalController.dart';

import '../../../common/utils/Color.dart';

Widget SwitchButton(YoungGoalController controller) {
  return Obx(() => Container(
        width: 320.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.h, top: 20.h),
              child: FlutterSwitch(
                width: 80.0.w,
                height: 40.0.h,
                showOnOff: true,
                valueFontSize: 13.sp,
                toggleSize: 30.0,
                value: controller.switchValue.value,
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
            ),
            controller.switchValue.value
                ? InkWell(
                    onTap: () {
                      controller.updateCanEdit();
                    },
                    child: Container(
                      child: Text(
                        "목표 수정",
                        style: TextStyle(
                          color: wOrange200Color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ));
}
