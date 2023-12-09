import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/OrangeButton.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/PopUp.dart';
import '../../../popup/AcoountPopup.dart';

Widget NextButton(OldInformationController controller, BuildContext context) {
  return Obx(() => controller.canNextStep.value
      ? Center(
    child: InkWell(
      onTap: () {
        var old = controller.createSenior();
        AccountPopup().showDialog(context, old);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 60.h),
          child: OrangeButton("다음"))
    ),
  )
      : Center(
    child: InkWell(
      onTap: () {
        ToastMessage().showtoast("모든 문항을 입력해주세요.");
      },
      child: Container(
        width: 335.w,
        height: 50.h,
        margin: EdgeInsets.only(top: 30.h, bottom: 60.h,left: 20.w, right: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: wGrey200Color),
            color: wGrey100Color,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: ButtonText("다음", wGrey400Color),
        ),
      ),
    ),
  ));
}
