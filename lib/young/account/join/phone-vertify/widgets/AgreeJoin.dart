
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../../common/utils/Color.dart';
import '../../controller/YoungJoinTotalController.dart';

class AgreeJoin extends StatelessWidget {
  YoungJoinTotalController controller;


  AgreeJoin(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> controller.canInputVertifyNumber?Center(
      child: Container(
        margin: EdgeInsets.only(top: 124.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  width: 24.w,
                  height: 23.h,
                  child: Checkbox(

                      activeColor: wGrey500Color,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.5))),
                      fillColor: const MaterialStatePropertyAll(wWhiteColor),
                      checkColor: wGrey500Color,
                      visualDensity: VisualDensity.standard,
                      side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return const BorderSide(color: wGrey500Color, width: 2);
                          }
                          return const BorderSide(color: wGrey500Color, width: 2);
                        },
                      ),
                      value: controller.isCheckAgree,
                      onChanged: (bool? newValue) {
                        controller.checkAgree(newValue!);
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: SubTitle2Text("(필수) 개인정보 수집 동의", wGrey800Color),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 35.w),
              width: 7.w,
              height: 12.h,
              child: Image.asset("assets/images/icon/next-icon.png"),
            )
          ],
        ),
      ),
    ):Container());
  }
}
