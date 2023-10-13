
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final int stepNumber;


  ProgressBar(this.stepNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                      color: stepNumber == 1 ? kOrangeColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 80.w,
                    height: 2.h,
                    color: stepNumber == 1 ? kOrangeColor : Colors.grey,
                  ),
                  Container(
                    width: 23.w,
                    height: 23.h,
                    decoration: BoxDecoration(
                      color: stepNumber == 2 ? kOrangeColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 80.w,
                    height: 2.h,
                    color: stepNumber == 2 ? kOrangeColor : Colors.grey,
                  ),
                  Container(
                    width: 23.w,
                    height: 23.h,
                    decoration: BoxDecoration(
                      color: stepNumber == 3 ? kOrangeColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 270.w,
              margin: EdgeInsets.only(right: 45.w, top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "부양자 정보 입력",
                      style: TextStyle(color: kTextBlackColor, fontSize: 11.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30.w),
                    child: Text(
                      "시니어 정보 입력",
                      style: TextStyle(color: kTextBlackColor, fontSize: 11.sp),
                    ),
                  ),
                  Container(
                    child: Text(
                      "완료",
                      style: TextStyle(color: kTextBlackColor, fontSize: 11.sp),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
