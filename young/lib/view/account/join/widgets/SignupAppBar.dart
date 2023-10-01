import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int stepNumber;
  final bool canBack;

  SignUpAppBar({required this.stepNumber, required this.canBack});

  @override
  Size get preferredSize => Size.fromHeight(75.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 0.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 23.w,
                      height: 23.h,
                      decoration: BoxDecoration(
                        color: stepNumber == 1 ? Colors.black : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 2.h,
                      color: stepNumber == 1 ? Colors.black : Colors.grey,
                    ),
                    Container(
                      width: 23.w,
                      height: 23.h,
                      decoration: BoxDecoration(
                        color: stepNumber == 2 ? Colors.black : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 2.h,
                      color: stepNumber == 2 ? Colors.black : Colors.grey,
                    ),
                    Container(
                      width: 23.w,
                      height: 23.h,
                      decoration: BoxDecoration(
                        color: stepNumber == 3 ? Colors.black : Colors.grey,
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
        ));
  }
}
