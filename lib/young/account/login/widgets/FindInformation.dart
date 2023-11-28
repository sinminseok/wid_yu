import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/utils/Color.dart';
import '../../find/find-id/FindIdView.dart';
import '../../find/find-password/FindPasswordView.dart';

Widget FindInformation() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 190.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => FindIdView(), transition: Transition.fadeIn);
            },
            child: Container(
              child: Text(
                "아이디 찾기",
                style: TextStyle(
                    color: wGrey600Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
          ),
          Container(
            width: 1,
            height: 20.h,
            color: wGreyColor,
          ),
          InkWell(
            onTap: () {
              Get.to(() => FindPasswordView(), transition: Transition.fadeIn);
            },
            child: Container(
              child: Text(
                "비밀번호 찾기",
                style: TextStyle(
                    color: wGrey600Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
