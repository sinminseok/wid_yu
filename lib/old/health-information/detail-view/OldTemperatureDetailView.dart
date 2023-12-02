import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';
import 'package:wid_yu/old/health-information/detail-view/widgets/OldHealthGraph.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../../../common/utils/constants/HealthExplanationConstants.dart';
import '../../../young/health-infroamtion/detail-view/widgets/YoungHealthGraph.dart';

class OldTemperatureDetailView extends StatefulWidget {
  TestUser user;


  OldTemperatureDetailView(this.user);

  @override
  State<OldTemperatureDetailView> createState() => _OldTemperatureDetailViewState();
}

class _OldTemperatureDetailViewState extends State<OldTemperatureDetailView> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wYellow100Color,
      appBar: CommonAppBar(
        title: "체온",
        color: wYellow100Color,
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h),
              width: 330.w,
              height: 420.h,
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

  Widget _buildInformation() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Text(
                "심박수란?",
                style: TextStyle(
                    color: wTextBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isExpand = !isExpand;
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
                child: Text(
                  overflow: isExpand ? null : TextOverflow.ellipsis,
                  HealthExplanation.HEART_EXPLANATION,
                  style: TextStyle(
                      color: wGrey600Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
              ),
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

  Widget _buildNormalInformation() {
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
                child: Text(
                  "100~95",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                      color: wTextBlackColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w, top: 3.h),
                child: Text(
                  "bpm",
                  style: TextStyle(color: wGrey600Color),
                ),
              )
            ],
          ),
          Center(
            child: Container(
              child: Text(
                "정상범위",
                style: TextStyle(color: wGrey600Color),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildGraph() {
    return OldHealthGraph([
      10,
      20,
      30,
      20,
      50,
      60,
      30,
      10,
      20,
      30,
      20,
      50,
      60,
      30,
      10,
      20,
      30,
      20,
      50,
      60,
      30,
      20,
      50,
      30
    ]);
  }
}
