import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/YoungHealthGraph.dart';

import '../../../../common/utils/FilePath.dart';

class O2DetailView extends StatelessWidget {
  final TestUser? user;

  O2DetailView(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(
        title: "산소포화도",
        color: wPurpleBackGroundColor,
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            Container(
              width: 330.w,
              height: 460.h,
              decoration: BoxDecoration(
                  color: wWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  _buildGraph(),
                  _buildAvaeage(),
                ],
              ),
            ),
            _buildInformation(),
          ],
        ),
      ),
    );
  }

  Widget _buildInformation(){
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Text("산소포화도란?", style: TextStyle(color: wTextBlackColor, fontWeight: FontWeight.w600, fontSize: 14.sp),),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
              child: Text("일반적으로 혈액 산소포화도는 95~100%이며 혈액이 최대한의 산소를 운반한다는 것을 의미합니다.", style: TextStyle(color: wGrey600Color, fontWeight: FontWeight.w500, fontSize: 14.sp),),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNormalInformation(),
                _buildNormalInformation(),
                _buildNormalInformation(),
                _buildNormalInformation(),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNormalInformation(){
    return Container(
      width: 145.w,
      height: 130.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("100~95", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp, color: wTextBlackColor),),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w, top: 3.h),
                child: Text("%", style: TextStyle(color: wGrey600Color),),
              )
            ],
          ),
          Center(
            child: Container(
              child: Text("정상범위", style: TextStyle(color: wGrey600Color),),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          height: 70.h,
          margin: EdgeInsets.only(top: 12.h, left: 20.w),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: wWhiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: wGrey200Color, width: 3.sp)),
                child: Image.asset(
                    commonImagePath + "health-information/old-man.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: Text(
                  "${user?.name}",
                  style: TextStyle(
                      color: wTextBlackColor, fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvaeage(){
    return Center(
      child: Container(
        width: 335.w,
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150.w,
            ),
            Container(
              width: 1,
              height: 42.h,
              color: wGrey200Color,
            ),
            Container(
              width: 150.w,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Text("부모님님 평균", style: TextStyle(color: wGrey400Color, fontSize: 14.sp, fontWeight: FontWeight.w600),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("93", style: TextStyle(color: wTextBlackColor, fontSize: 20.sp, fontWeight: FontWeight.w600),),
                        ),
                        Container(
                          child: Text("bpm", style: TextStyle(color: wGrey600Color, fontSize: 14.sp),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGraph() {
    return YoungHealthGraph([10, 20, 30, 20, 50, 60, 30,10, 20, 30, 20, 50, 60, 30,10, 20, 30, 20, 50, 60, 30,20,50,30]);
  }
}
