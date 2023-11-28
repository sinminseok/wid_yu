import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/health-infroamtion/detail-view/widgets/HealthGraph.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/model/user/TestUser.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../../../common/utils/constants/HealthExplanationConstants.dart';

class TemperatureDetailView extends StatefulWidget {
  final TestUser? user;

  TemperatureDetailView(this.user);

  @override
  State<TemperatureDetailView> createState() => _TemperatureDetailViewState();
}

class _TemperatureDetailViewState extends State<TemperatureDetailView> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "체온",
        color: wWhiteBackGroundColor,
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildGraph(),
            _buildAvaeage(),
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
                            margin: EdgeInsets.only(left: 1.w, bottom: 14.h),
                            child: Icon(Icons.fiber_manual_record_outlined, size: 8.sp,)
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
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                "체온은...",
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
                  HealthExplanation.TEMPERATURE_EXPLANATION,
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
                margin: EdgeInsets.only(left: 1.w, bottom: 14.h),
                child: Icon(Icons.fiber_manual_record_outlined, size: 8.sp,)
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
    return HealthGraph([
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
