import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../common/utils/Color.dart';

Widget PointWidget(int point){
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
            margin: EdgeInsets.only(left: 25.w,top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(),
                  child: SubTitle2Text("사용할 수 있는 포인트",kTextGreyColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: PercentageText("${point} P",kTextBlackColor),
                ),

              ],
            ),
          )
        ],
      ),
    ),
  );
}