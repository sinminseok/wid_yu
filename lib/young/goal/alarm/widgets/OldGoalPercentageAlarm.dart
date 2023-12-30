

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../goal-detail/view/YoungGoalDetailView.dart';
import '../controller/YoungAlarmController.dart';

class OldGoalPercentageAlarm extends StatelessWidget {
  YoungAlarmController controller;


  OldGoalPercentageAlarm(this.controller);
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
                      child: SubTitle2Text("부모님 님 목표 40%달성!", wGrey800Color),
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
                      child: Body2Text("부모님 님의 목표달성 결과를 확인하실래요?", wGrey700Color),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(() => YoungGoalDetailView());
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
      child: Image.asset("assets/images/icon/alarm/old-icon.png",fit: BoxFit.contain,),
    );
  }
}
