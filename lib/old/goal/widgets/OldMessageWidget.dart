import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';


class OldMessageWidget extends StatefulWidget {
  const OldMessageWidget({Key? key}) : super(key: key);

  @override
  _OldMessageWidgetState createState() => _OldMessageWidgetState();
}

class _OldMessageWidgetState extends State<OldMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSuccessPercentageMessage(),
        _buildDrugMissionAlarm(),
        _buildWalkMissionAlarm(),
        _buildCommonMissionAlarm(),
      ],
    );
  }

  Widget _buildSuccessPercentageMessage(){
    return Container(
      height: 76.w,
      color: wOrangeBackGroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w,top: 15.h),
            width: 30.w,
            height: 30.h,
            child: Image.asset(commonImagePath + "goal/goal.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h,left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 247.w,

                        child: Text("오늘은 40%달성!",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.sp, color: wGrey800Color, fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        child: Text("오늘", style: TextStyle(color: wGrey500Color, fontSize: 12.sp),),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: Text("목표달성 결과를 확인하실래요?", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14.sp, color: wGrey700Color, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h, left: 5.w),
                      child: Icon(Icons.arrow_forward_ios_sharp, color: wGrey500Color, size: 14.sp,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDrugMissionAlarm(){
    return Container(
      height: 76.w,
      color: wWhiteBackGroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w,top: 18.h),
            width: 30.w,
            height: 30.h,

            child: Image.asset(commonImagePath + "alarm/drug-icon.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h,left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 247.w,
                        child: Text("13:00 약을 드시지 않았어요!",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.sp, color: wGrey800Color, fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        child: Text("오늘", style: TextStyle(color: wGrey500Color, fontSize: 12.sp),),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: Text("확인하기?", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14.sp, color: wGrey700Color, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h, left: 5.w),
                      child: Icon(Icons.arrow_forward_ios_sharp, color: wGrey500Color, size: 14.sp,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildWalkMissionAlarm(){
    return Container(
      height: 76.w,
      color: wWhiteBackGroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w,top: 15.h),
            width: 30.w,
            height: 30.h,
            child: Image.asset("assets/common/alarm/walk-icon.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h,left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 247.w,

                        child: Text("13:00 외출을 가지 않았어요",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.sp, color: wGrey800Color, fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        child: Text("오늘", style: TextStyle(color: wGrey500Color, fontSize: 12.sp),),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: Text("목표달성 결과를 확인하실래요?", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14.sp, color: wGrey700Color, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h, left: 5.w),
                      child: Icon(Icons.arrow_forward_ios_sharp, color: wGrey500Color, size: 14.sp,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildCommonMissionAlarm(){
    return Container(
      height: 76.w,
      color: wWhiteBackGroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w,top: 15.h),
            width: 30.w,
            height: 30.h,
            child: Image.asset(commonImagePath + "alarm/flag-icon.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h,left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 247.w,

                        child: Text("오늘은 40%달성!",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.sp, color: wGrey800Color, fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        child: Text("오늘", style: TextStyle(color: wGrey500Color, fontSize: 12.sp),),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: Text("목표달성 결과를 확인하실래요?", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14.sp, color: wGrey700Color, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h, left: 5.w),
                      child: Icon(Icons.arrow_forward_ios_sharp, color: wGrey500Color, size: 14.sp,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
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
