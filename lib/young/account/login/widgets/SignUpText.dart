
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/utils/Color.dart';
import '../../join/phone-vertify/VertifyPhoneView.dart';

Widget SignUpText(){
  return Container(
    margin: EdgeInsets.only(top: 120.h),
    child: InkWell(
        onTap: () {
          Get.to(() => VerificationPhoneView(), transition: Transition.fadeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "회원가입 하러가기",
              style: TextStyle(
                  color: wPurpleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            Container(
              child: Icon(
                Icons.navigate_next_outlined,
                color: wPurpleColor,
              ),
            )
          ],
        )),
  );
}