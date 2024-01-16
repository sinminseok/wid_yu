import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/common/utils/constants/HealthType.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/YoungHealthGraph.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/FilePath.dart';

class HeartBitDetailView extends StatefulWidget {
  final OldUser? user;

  HeartBitDetailView(this.user);

  @override
  State<HeartBitDetailView> createState() => _HeartBitDetailViewState();
}

class _HeartBitDetailViewState extends State<HeartBitDetailView> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(
        title: "심박수",
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
              height: 470.h,
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
              child: SubTitle2Text("심박수란?", wTextBlackColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
              child: Body2Text("일반적으로 혈액 산소포화도는 95~100%이며 혈액이 최대한의 산소를 운반한다는 것을 의미합니다.",wGrey600Color),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: _buildNormalInformation()
        )
      ],
    );
  }

  Widget _buildNormalInformation(){
    return Container(
      width: 335.w,
      height: 130.h,
      margin: EdgeInsets.only(right: 10.w, bottom: 60.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: wWhiteColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("50~130", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp, color: wTextBlackColor),),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w, top: 3.h),
                child: Text("bpm", style: TextStyle(color: wGrey600Color),),
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
          margin: EdgeInsets.only(top: 0.h, left: 20.w),
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
                child: SubTitle1Text(
                    "${widget.user?.name}",
                    wTextBlackColor
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: SubTitle2Text("평소보다", wOrange200Color),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Title2Text("93", wOrange200Color),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3.w),
                          child: SubTitle2Text("bpm", wOrange200Color),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 2.w),
                          child: SubTitle2Text(" 낮아요", wOrange200Color),
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
                      child: SubTitle2Text("부모님님 평균", wGrey400Color),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Title2Text("93", wTextBlackColor),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          child: SubTitle2Text("bpm", wGrey600Color),
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
    return YoungHealthGraph([10, 20, 30, 20, 50, 60, 30,10, 20, 30, 20, 50, 60, 30,10, 20, 30, 20, 50, 60, 30,20,50,30], HealthType.HEART_BIT);
  }
}
