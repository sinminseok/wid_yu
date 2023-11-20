
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 340.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: kLightGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // 원 모양으로 설정
                    color: Colors.grey, // 배경색 설정
                  ),
                  width: 57,
                  height: 57,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w,top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("아들", style: TextStyle(color: kTextBlackColor),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Text("010-1234-1234",style: TextStyle(color: kTextBlackColor),),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20.w),
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
            )
          ],
        ),
      ),
    );
  }
}
