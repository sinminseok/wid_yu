import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
        width: 335.w,
        height: 50.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 20.h),
        decoration: BoxDecoration(
            color: wOrangeColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text("다음"),
        ),
      ),
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
        margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
        decoration: BoxDecoration(
            color: Color(0xffD5DDE4),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text("다음"),
        ),
      ),
    ),
  ));
}
