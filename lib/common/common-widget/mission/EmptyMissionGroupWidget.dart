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
        children: [
          Container(
            margin: EdgeInsets.only(top: 113.h),

            width: 30.w,
            height: 30.h,
            child: Image.asset("assets/images/icon/smile-icon.png")
          ),
          Container(
            margin: EdgeInsets.only(top: 14.h),
            child: Text(
              "새로운 목표를 생성해보세요!",
              style: TextStyle(color: wGrey500Color, fontSize: 14.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                margin: EdgeInsets.only(right: 20.w),
                width: 77.w,
                height: 123.h,
                child: Image.asset("assets/images/icon/arrow-icon.png"),
              )
            ],
          )

        ],
      ),
    );
  }
}
