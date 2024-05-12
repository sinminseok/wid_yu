
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/PopUp.dart';
import '../../controller/YoungJoinTotalController.dart';
import '../../old-information/view/OldInformationView.dart';
import '../controller/YoungJoinController.dart';

class SelectButton extends StatelessWidget {
  final YoungJoinTotalController controller;


  SelectButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
        margin: EdgeInsets.only(right: 20.w,left: 20.w,top: 240.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.joinOnlyMyAccount();
              },
              child: Container(
                width: 108.w,
                height: 44.h,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: wGrey300Color, width: 1),
                    color: wGrey200Color,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: ButtonText("내 계정만 생성", wGrey600Color,),
                ),
              ),
            ),
            InkWell(
              onTap: () async{
                var response = await controller.joinAndOldAccount();
                if (response == true) {
                  var offAll = Get.offAll(() => OldInformationView(controller), transition: Transition.fadeIn);
                } else {
                  ToastMessage().showtoast("계정을 생성할 수 없습니다.");
                }
              },
              child: Container(
                width: 221.w,
                height: 44.h,
                decoration: BoxDecoration(
                    color: wOrangeColor,
                    border: Border.all(color: wOrange200Color),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(

                  child: Container(
                      child: ButtonText("계속해서 부모님 계정 생성",wWhiteColor,)),
                ),
              ),
            ),
          ],
        ));
  }
}
