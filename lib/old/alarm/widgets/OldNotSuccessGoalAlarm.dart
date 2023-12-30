

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/old/alarm/controller/OldAlarmController.dart';
import 'package:wid_yu/old/goal/goal-detail/view/OldGoalDetailView.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';

class OldNotSuccessGoalAlarm extends StatelessWidget {
  OldAlarmController controller;


  OldNotSuccessGoalAlarm(this.controller);

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
          margin: EdgeInsets.only(left: 9.w,top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 294.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SubTitle2Text("14:00 약제목을 드시지 않았어요.", wGrey800Color),
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
                      child: Body2Text("확인하러 가기", wGrey700Color),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(() => OldGoalDetailView());
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
      width: 35.w,
      height: 35.h,
      child: Image.asset("assets/images/icon/alarm/drug-icon.png",fit: BoxFit.cover,),
    );
  }
}
