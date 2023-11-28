import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungLoginController.dart';

class AutoLoginCheckBox extends StatelessWidget {
  final YoungLoginController controller;

  const AutoLoginCheckBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 165.w, bottom: 20.h),
      width: 185.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => Theme(
              data: ThemeData(unselectedWidgetColor: wTextBlackColor),
              child: Checkbox(
                focusColor: Colors.grey,
                checkColor: wTextBlackColor,
                activeColor: Colors.white,
                value: controller.isChecked.value,
                onChanged: (value) {
                  controller.updateIsCheck(value);
                  //controller.isChecked.value = value!;
                },
              ))),
          Text(
            "자동로그인",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: wTextBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
