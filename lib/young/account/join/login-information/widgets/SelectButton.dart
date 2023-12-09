
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/account/join/controller/YoungJoinController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/PopUp.dart';
import '../../../../../common/utils/exception/InvalidInformationException.dart';
import '../../finish/JoinSuccessOnlyYoungView.dart';
import '../../finish/JoinSuccessView.dart';
import '../../old-information/OldInformationView.dart';

class SelectButton extends StatelessWidget {
  final YoungJoinController controller;


  SelectButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 195.h,right: 20.w,left: 20.w,bottom: 60.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                  Get.to(() => JoinSuccessOnlyYoungView(),
                      transition: Transition.fadeIn);
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
              onTap: () {
                Get.to(() => OldInformationView(),
                    transition: Transition.fadeIn);
              },
              child: Container(
                width: 206.w,
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
