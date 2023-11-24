import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';


class YoungMessageWidget extends StatefulWidget {
  const YoungMessageWidget({Key? key}) : super(key: key);

  @override
  _YoungMessageWidgetState createState() => _YoungMessageWidgetState();
}

class _YoungMessageWidgetState extends State<YoungMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        color: wWhiteColor,
        height: 76.h,
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
            width: 250.w,
            child: Text(
              "부모님 님이 올려두신 사진을 모두 읽었어요!",
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: wGrey800Color,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.h),
            child: Row(
              children: [
                Container(
                  width: 180.w,
                  child: Text(
                    "새로운 사진을 업로드해 주세요.",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: wGrey700Color, fontSize: 13.sp),
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

}
