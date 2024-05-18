
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/old/health-information/controller/OldHealthInformationController.dart';
import 'package:wid_yu/old/health-information/detail-view/OldTemperatureDetailView.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../../../common/utils/constants/HealthInformation.dart';
import '../../../young/health-infroamtion/temperature/view/TemperatureDetailView.dart';

class TemperatureInformation extends StatelessWidget {
  OldHealthInformationController controller;


  TemperatureInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Get.to(() => OldTemperatureDetailView(controller.user.value), transition: Transition.fadeIn);
        },
        child: _buildNomal());
  }

  Widget _buildNomal(){
    return Container(
      width: 315.w,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("체온", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 315.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: wWhiteBackGroundColor,
                border: Border.all(color: wGrey200Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    margin: EdgeInsets.only(left: 9.w),
                    child: Image.asset(commonImagePath + "health-information/temperature-icon.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h,left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("${controller.getUserTemperature()}", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey800Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12.h, left: 2.w),
                              child: Icon(Icons.fiber_manual_record_outlined, size: 10.sp,),
                            )
                          ],
                        ),
                        Container(
                          child: Text("${HealthInformationState.NOMAL.message}", style: TextStyle(color: wGrey700Color, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                  ),
                ],),
                Container(
                  margin: EdgeInsets.only(right: 13.w),
                  width: 80.w,
                  height: 44.h,
                  child: Image.asset(commonImagePath + "health-information/graph/purple-graph.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDangerous(){
    return  Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("체온", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 315.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: wError100Color,
                border: Border.all(color: wErrorColor),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    margin: EdgeInsets.only(left: 9.w),
                    child: Image.asset(commonImagePath + "health-information/danger-temperature-icon.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h,left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("${controller.getUserTemperature()}", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wErrorColor),),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12.h, left: 2.w),
                              child: Icon(Icons.fiber_manual_record_outlined, size: 10.sp, color: wErrorColor,),
                            )
                          ],
                        ),
                        Container(
                          child: Text("${HealthInformationState.DANGEROUS.message}", style: TextStyle(color: wErrorColor, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                  ),
                ],),
                Container(
                  margin: EdgeInsets.only(right: 13.w),
                  width: 80.w,
                  height: 44.h,
                  child: Image.asset(commonImagePath + "health-information/graph/red-graph.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAttention(){
    return  Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("체온", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 315.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: wYellow100Color,
                border: Border.all(color: wYellowColor),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    margin: EdgeInsets.only(left: 9.w),
                    child: Image.asset(commonImagePath + "health-information/o2-icon.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h,left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("${controller.getUserTemperature()}", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey800Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12.h, left: 2.w),
                              child: Icon(Icons.fiber_manual_record_outlined, size: 10.sp),
                            )
                          ],
                        ),
                        Container(
                          child: Text("${HealthInformationState.ATTENTION.message}", style: TextStyle(color: wGrey800Color, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                  ),
                ],),
                Container(
                  margin: EdgeInsets.only(right: 13.w),
                  width: 80.w,
                  height: 44.h,
                  child: Image.asset(commonImagePath + "health-information/graph/yellow-graph.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}
