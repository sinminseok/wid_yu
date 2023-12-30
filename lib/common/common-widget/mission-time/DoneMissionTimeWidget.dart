
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/Color.dart';

Widget DoneMissionTimeWidget(String time){
  return Container(
    width: 122.w,
    height: 30.h,
    decoration: BoxDecoration(
      color: wOrangeColor,
      border: Border.all(color: wOrange200Color),
      borderRadius: BorderRadius.all(Radius.circular(50))
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(left: 0.w),
              child: ChipText("${time}", wWhiteColor)),
          Container(
            width: 13.w,
              height: 9.5.h,
              margin: EdgeInsets.only(left: 3.w),
              child: Image.asset("assets/images/icon/check-icon.png")
          )
        ],
      )
    ),
  );

}