import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/controller/AddOldController.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/view/AddOldSuccessView.dart';

import '../../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/PopUp.dart';
import '../../../../account/join/old-information/controller/OldInformationController.dart';

Widget AddNextButton(AddOldController controller, BuildContext context) {
  return Obx(() => controller.canOldNextStep.value
      ? Center(
    child: InkWell(
        onTap: () async{
          var old = await controller.joinOld();
          if(old != null) {
            Get.to(() => AddOldSuccessView(old), transition: Transition.fade);
          }else{
            ToastMessage().showtoast("네트워크 오류");
          }

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
