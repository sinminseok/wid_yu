import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/constants/HealthExplanationConstants.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/YoungHealthGraph.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/model/user/TestUser.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';

class HeartBitDetailView extends StatefulWidget {
  final TestUser? user;

  HeartBitDetailView(this.user);

  @override
  State<HeartBitDetailView> createState() => _HeartBitDetailViewState();
}

class _HeartBitDetailViewState extends State<HeartBitDetailView> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(
        title: "심박수",
        color: wWhiteBackGroundColor,
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
                  "${widget.user?.name}",
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

  Widget _buildGraph() {
    return YoungHealthGraph([
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
