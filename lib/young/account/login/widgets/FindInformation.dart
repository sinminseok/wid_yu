import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../../find/find-id/view/FindIdView.dart';
import '../../find/find-password/view/FindPasswordView.dart';

Widget FindInformation() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 16.h),
      width: 205.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => FindIdView(), transition: Transition.fadeIn);
            },
            child: Container(
              child: ButtonText("아이디 찾기", wGrey600Color),
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
              child: ButtonText("비밀번호 찾기", wGrey600Color),
            ),
          ),
        ],
      ),
    ),
  );
}
