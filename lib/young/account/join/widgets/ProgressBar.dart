
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/text/CustomText.dart';

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
                  child: Helper2Text("보호자 정보", wOrange200Color)
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Helper2Text("부모님 정보", wGrey300Color)
                ),
                Container(
                  child: Helper2Text("완료", wGrey300Color)
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
                  child: Helper2Text("보호자 정보", wOrange200Color)
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Helper2Text("부모님 정보", wOrange200Color)
                ),
                Container(
                  child: Helper2Text("완료", wGrey300Color)
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
                  child: Helper2Text("보호자 정보", wOrange200Color)
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Helper2Text("부모님 정보", wOrange200Color)
                ),
                Container(
                  child: Helper2Text("완료", wOrange200Color)
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
