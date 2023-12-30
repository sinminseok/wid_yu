
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../../join/phone-vertify/VertifyPhoneView.dart';

Widget SignUpText(){
  return Center(
    child: Container(
      width: 160.w,
      margin: EdgeInsets.only(top: 166.h),
      child: InkWell(
          onTap: () {
            Get.to(() => VerificationPhoneView(), transition: Transition.fadeIn);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonText("회원 가입하러 가기", wPurpleColor),
              Container(
                margin: EdgeInsets.only(top: 0.h),
                child: Icon(
                  Icons.navigate_next_outlined,
                  color: wPurpleColor,
                  size: 21.sp,
                ),
              )
            ],
          )),
    ),
  );
}