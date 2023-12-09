
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../../../../common/utils/Color.dart';

Widget LoginMainText() {
  return Container(
    child: Column(
      children: [
        Container(
          height: 30.h,
          margin: EdgeInsets.only(top: 28.h),
          child: Title2Text("보호자 계정으로 로그인해요", wGrey800Color)
        ),
        Container(
          height: 21.h,
          margin: EdgeInsets.only(top: 5.h),
          child: Body2Text("부모님의 계정 생성은 보호자 계정에서 가능해요.", wGrey600Color)
        ),
      ],
    ),
  );
}