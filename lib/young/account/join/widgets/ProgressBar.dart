
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/Color.dart';

class ProgressBar extends StatelessWidget {
  final int stepNumber;

  ProgressBar(this.stepNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if(stepNumber == 1)
            _buildStepOne(),
          if(stepNumber == 2)
            _buildStepTwo(),
          if(stepNumber == 3)
            _buildStepThree()

        ],
      ),
    );
  }

  Widget _buildStepOne(){
    return Column(
      children: [
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 23.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                ),

                Container(
                  width: 90.w,
                  height: 1.h,
                  color: wOrange200Color
                ),

                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: wGrey300Color,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wGrey200Color
                ),

                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: wGrey300Color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 290.w,
            margin: EdgeInsets.only(right: 45.w, top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "보호자 정보",
                    style: TextStyle(color: wOrange200Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "부모님 정보",
                    style: TextStyle(color: wGrey300Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Text(
                    "완료",
                    style: TextStyle(color: wGrey300Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildStepTwo() {
    return Column(
      children: [
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check,size: 11.sp,color: wWhiteColor,),
                  ),
                ),

                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wOrange200Color
                ),

                Container(
                  width: 23.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wGrey200Color
                ),

                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: wGrey300Color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 290.w,
            margin: EdgeInsets.only(right: 45.w, top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "보호자 정보",
                    style: TextStyle(color: wOrange200Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "부모님 정보",
                    style: TextStyle(color: wOrange200Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Text(
                    "완료",
                    style: TextStyle(color: wGrey300Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildStepThree() {
    return Column(
      children: [
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check,size: 11.sp,color: wWhiteColor,),
                  ),
                ),

                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wOrange200Color
                ),

                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check,size: 11.sp,color: wWhiteColor,),
                  ),
                ),
                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wOrange200Color
                ),

                Container(
                  width: 23.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check,size: 11.sp,color: wWhiteColor,),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 290.w,
            margin: EdgeInsets.only(right: 45.w, top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "보호자 정보",
                    style: TextStyle(color: wOrange200Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "부모님 정보",
                    style: TextStyle(color: wOrange200Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Text(
                    "완료",
                    style: TextStyle(color: wOrange200Color, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
