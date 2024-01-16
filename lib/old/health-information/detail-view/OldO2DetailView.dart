import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/health-information/detail-view/widgets/OldHealthGraph.dart';

import '../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../../../common/utils/constants/HealthExplanationConstants.dart';
import '../../../young/health-infroamtion/main/widgets/YoungHealthGraph.dart';

class OldO2DetailView extends StatefulWidget {
  OldUser user;

  OldO2DetailView(this.user);

  @override
  State<OldO2DetailView> createState() => _OldO2DetailViewState();
}

class _OldO2DetailViewState extends State<OldO2DetailView> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(
        title: "산소포화도",
        color: wWhiteColor,
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Text("평소보다", style: TextStyle(color: wGrey400Color, fontSize: 14.sp, fontWeight: FontWeight.w600),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4.w),
                          child: Title2Text("4", wOrange200Color),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          child: SubTitle2Text("% ", wOrange200Color),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3.w),
                          child: Title3Text("높아요 ", wOrange200Color),
                        ),

                      ],
                    )
                  ],
                ),
              ),
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
                          margin: EdgeInsets.only(left: 5.w),
                          child: Text("%", style: TextStyle(color: wGrey600Color, fontSize: 14.sp),),
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
            // Container(
            //   margin: EdgeInsets.only(left: 20.w, top: 20.h),
            //   child: Text(
            //     "산소포화도란?",
            //     style: TextStyle(
            //         color: wTextBlackColor,
            //         fontWeight: FontWeight.w600,
            //         fontSize: 14.sp),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       isExpand = !isExpand;
            //     });
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
            //     child: Text(
            //       overflow: isExpand ? null : TextOverflow.ellipsis,
            //       HealthExplanation.HEART_EXPLANATION,
            //       style: TextStyle(
            //           color: wGrey600Color,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 14.sp),
            //     ),
            //   ),
            // )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNormalInformation(),
                _buildNormalInformation2(),
                _buildNormalInformation3(),
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
      decoration: BoxDecoration(
        color: wWhiteColor,
      ),
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
                  "%",
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
  Widget _buildNormalInformation2() {
    return Container(
      width: 145.w,
      height: 130.h,
      margin: EdgeInsets.only(top: 25.h),
      decoration: BoxDecoration(
        color: wWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "95~90",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                      color: wTextBlackColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w, top: 3.h),
                child: Text(
                  "%",
                  style: TextStyle(color: wGrey600Color),
                ),
              )
            ],
          ),
          Center(
            child: Container(
              child: Text(
                "수면중일 경우",
                style: TextStyle(color: wGrey600Color),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "저 산소증 주의 상태",
                style: TextStyle(color: wGrey600Color),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildNormalInformation3() {
    return Container(
      width: 145.w,
      height: 130.h,
      decoration: BoxDecoration(
        color: wWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "95~95",
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
      97,
      92,
      90,
      93,
      90,
      85,
      93,
      95,
      96,
      98,
      96,
      93,
      92,
      91,
      90,
      88,
      92,
      95,
      97,
      94,
      97,
      93,
      92,
      91
    ]);
  }
}
