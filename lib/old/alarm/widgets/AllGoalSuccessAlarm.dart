

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
import '../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';
import '../../../sql-lite/Meaasge.dart';

class AllGoalSuccessAlarm extends StatelessWidget {
  MessageFcm messageFcm;

  AllGoalSuccessAlarm( this.messageFcm);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
      width: 370.w,
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
                width: 260.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SubTitle2Text("${messageFcm.title}", wGrey800Color),
                    ),

                  ],
                ),
              ),
              Container(
                width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Body2Text("${messageFcm.body}", wGrey700Color),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 100.w,
                      child: Body2Text(messageFcm.formatDateTime(), kTextBlackColor),
                    ),

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
      child: Image.asset("assets/images/mission/best.png",fit: BoxFit.cover,),
    );
  }
}
