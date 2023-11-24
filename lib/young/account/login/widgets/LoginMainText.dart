
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/Color.dart';

Widget LoginMainText() {
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 28.h),
          child: Text(
            "보호자 계정으로 로그인해요",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: kTextBlackColor),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text(
            "부모님 계정 생성은 보호자 계정에서 가능해요.",
            style: TextStyle(fontSize: 14.sp, color: kTextGreyColor),
          ),
        ),
      ],
    ),
  );
}