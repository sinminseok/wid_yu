
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              margin: EdgeInsets.only(left: 20.w),
              child: Text("${time}", style: TextStyle(color: wWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600),)),
          Container(
            margin: EdgeInsets.only(left: 3.w),
            child: Icon(Icons.check, color: wWhiteColor,),
          )
        ],
      )
    ),
  );

}