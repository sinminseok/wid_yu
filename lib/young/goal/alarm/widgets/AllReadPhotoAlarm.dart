

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';

import '../controller/YoungAlarmController.dart';

class AllReadPhotoAlarm extends StatelessWidget {
  YoungAlarmController controller;


  AllReadPhotoAlarm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
      width: 372.w,
      height: 76.h,
      child: Row(
        children: [
          _buildImage(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 12.w,top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 294.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SubTitle2Text("부모님 님이 올려두신 사진을 모두 읽었어요!", wGrey800Color),
                    ),
                    Container(
                      child: Helper2Text("오늘", wGrey500Color),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Body2Text("새로운 사진을 업로드해 주세요.", wGrey700Color),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(() => YoungFrameView(1));
                      },
                      child: Container(
                        width: 14.w,
                        height: 14.h,
                        margin: EdgeInsets.only(top: 8.h,left: 5.w),
                        child: Image.asset("assets/images/icon/next-icon.png")
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
  
  Widget _buildImage(){
    return Container(
      margin: EdgeInsets.only(left: 19.w),
      width: 30.w,
      height: 30.h,
      child: Image.asset("assets/images/icon/alarm/camera-icon.png",fit: BoxFit.cover,),
    );
  }
}
