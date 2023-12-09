import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Color.dart';

Widget NoneMissionTimeWidget(String time) {
  return Container(
    width: 122.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: wGrey200Color,
        border: Border.all(color: wGrey300Color),
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: Text(
        "${time}",
        style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: wWhiteColor,
            fontSize: 16.sp,
            fontFamily: "Chip",
            fontWeight: FontWeight.w600),
      ),
    ),
  );
}
