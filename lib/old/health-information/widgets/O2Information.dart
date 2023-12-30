

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/old/health-information/controller/OldHealthInformationController.dart';
import 'package:wid_yu/old/health-information/detail-view/OldO2DetailView.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../../../common/utils/constants/HealthInformation.dart';
import '../../../young/health-infroamtion/o2/view/O2DetailView.dart';

class O2Information extends StatelessWidget {
  OldHealthInformationController controller;


  O2Information(this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Get.to(() => OldO2DetailView(controller.user.value), transition: Transition.fadeIn);
        },
        child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: _buildNomal()));
  }


  Widget _buildNomal(){
    return Obx(() => Container(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("산소포화도", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
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
                              child: Text("${controller.getUserO2()}", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey800Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2.h, left: 2.w),
                              child: Text("%", style: TextStyle(color: wGrey600Color, fontWeight: FontWeight.w600, ),),
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
    ));
  }

  Widget _buildDangerous(){
    return Obx(() => Container(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("산소포화도", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
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
                              child: Text("${controller.getUserO2()}", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wErrorColor),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2.h, left: 2.w),
                              child: Text("%", style: TextStyle(color: wErrorColor, fontWeight: FontWeight.w600, ),),
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
    ));
  }

  Widget _buildAttention(){
    return Obx(() => Container(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("산소포화도", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
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
                              child: Text("${controller.getUserO2()}", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey800Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2.h, left: 2.w),
                              child: Text("%", style: TextStyle(color: wGrey800Color, fontWeight: FontWeight.w600, ),),
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
    ));
  }

}
