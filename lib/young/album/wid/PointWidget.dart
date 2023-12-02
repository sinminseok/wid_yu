

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';

Widget PointWidget(){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 335.w,
      height: 75.h,
      decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: kBorderColor,width: 1)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 11.w),
            width: 85.w,
            height: 69.h,
            child: Image.asset("assets/common/album/point_hand.png"),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w,top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(),
                  child: Text("사용할 수 있는 포인트", style: TextStyle(fontSize: 16.sp, color: kTextGreyColor),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text("200 P",style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: kTextBlackColor),),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}