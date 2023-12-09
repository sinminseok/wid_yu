import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungLoginController.dart';

class AutoLoginCheckBox extends StatelessWidget {
  final YoungLoginController controller;

  const AutoLoginCheckBox({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.5.h),
      width: 325.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Obx(() => Container(
                  width: 24.w,
                  height: 23.h,
                  child: Checkbox(
                    activeColor: wGrey700Color,
                      fillColor: const MaterialStatePropertyAll(wWhiteColor),
                      checkColor: wGrey700Color,
                      visualDensity: VisualDensity.standard,
                      side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return const BorderSide(color: wGrey700Color, width: 2);
                          }
                          return const BorderSide(color: wGrey700Color, width: 2);
                        },
                      ),
                      value: controller.isChecked,
                      onChanged: (bool? newValue) {
                        controller.updateIsCheck(newValue);
                      }),
                )
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: ButtonText("자동로그인", wGrey700Color)
                ),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
