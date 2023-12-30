

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../frame/YoungFrameView.dart';
import '../controller/YoungAlarmController.dart';

class DangerousOldAlarm extends StatelessWidget {
  YoungAlarmController controller;


  DangerousOldAlarm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
      width: 372.w,

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
                      width: 247.w,
                      child: SubTitle2Text("김옥례 님의 건강 수치가 평소와 달라요!", wGrey800Color),
                    ),
                    Container(
                      child: Helper2Text("오늘", wGrey500Color),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 247.w,
                      margin: EdgeInsets.only(top: 8.h),
                      child: Body2Text("앱에서 확인하고 연락을 해보는 것이 좋을 것 같아요.", wGrey700Color),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(() => YoungFrameView(2));
                      },
                      child: Container(
                          width: 14.w,
                          height: 14.h,
                          margin: EdgeInsets.only(top: 13.h,left: 5.w),
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
      margin: EdgeInsets.only(left: 19.w,bottom: 0.h),
      width: 30.w,
      height: 30.h,
      child: Image.asset("assets/images/icon/alarm/dangerous-icon.png",fit: BoxFit.cover,),
    );
  }
}
