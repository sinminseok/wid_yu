import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Color.dart';

class EmptyMissionGroupWidget extends StatefulWidget {
  const EmptyMissionGroupWidget({Key? key}) : super(key: key);

  @override
  _EmptyMissionGroupWidgetState createState() =>
      _EmptyMissionGroupWidgetState();
}

class _EmptyMissionGroupWidgetState extends State<EmptyMissionGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 410.h,
      decoration: BoxDecoration(
          color: wWhiteColor,
          border: Border.all(color: wGrey100Color),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            width: 25.w,
            height: 25.h,
            child: Icon(
              Icons.sentiment_neutral,
              color: wGrey500Color,
              size: 50.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35.h),
            child: Text(
              "새로운 목표를 생성해보세요!",
              style: TextStyle(color: wGrey500Color, fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }
}
