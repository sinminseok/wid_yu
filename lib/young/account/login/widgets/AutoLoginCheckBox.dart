import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungLoginController.dart';

class AutoLoginCheckBox extends StatefulWidget {
  final YoungLoginController controller;

  const AutoLoginCheckBox({Key? key, required this.controller})
      : super(key: key);

  @override
  State<AutoLoginCheckBox> createState() => _AutoLoginCheckBoxState();
}

class _AutoLoginCheckBoxState extends State<AutoLoginCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.5.h),
      width: 335.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Obx(() => Container(
                  width: 24.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: Checkbox(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.5))),
                      activeColor: wGrey700Color,
                      fillColor: const MaterialStatePropertyAll(wWhiteColor),
                      checkColor: wGrey700Color,
                      visualDensity: VisualDensity.comfortable,
                      side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return const BorderSide(color: wGrey700Color, width: 2,);
                          }
                          return const BorderSide(color: wGrey700Color, width: 2);
                        },
                      ),
                      value: widget.controller.isChecked,
                      onChanged: (bool? newValue) {
                        widget.controller.updateIsCheck(newValue);
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
