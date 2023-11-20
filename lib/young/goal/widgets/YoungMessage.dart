import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

Widget YoungMessage() {
  return InkWell(
    onTap: () {
      print("미션 타입에 따라 페이지 이동");
    },
    child: Container(
      color: kTextWhiteColor,
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildMissionImage(),
              _buildMissionInformation(),
            ],
          ),
          _buildMessageDay(),
        ],
      ),
    ),
  );
}

Widget _buildMissionImage() {
  return Container(
    margin: EdgeInsets.only(left: 15.w),
    width: 30.w,
    height: 30.h,
    child: Image.asset(youngImagePath + "album/camera.png"),
  );
}

Widget _buildMissionInformation() {
  return Container(
    margin: EdgeInsets.only(top: 18.h, left: 10.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "부모님 님이 올려두신 사진을 모두 읽었어요!",
            style: TextStyle(
                color: wGrey800Color,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: Row(
            children: [
              Container(
                child: Text(
                  "새로운 사진을 업로드해 주세요.",
                  style: TextStyle(color: wGrey700Color, fontSize: 14.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: wGrey700Color,
                  size: 16.sp,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildMessageDay() {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    child: Text(
      "오늘",
      style: TextStyle(fontSize: 12.sp, color: wGrey500Color),
    ),
  );
}
