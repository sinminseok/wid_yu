

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/old/health-information/detail-view/widgets/OldHealthGraph.dart';

import '../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../../../common/utils/constants/HealthExplanationConstants.dart';
import '../../../young/health-infroamtion/main/widgets/YoungHealthGraph.dart';

class OldHeartBitDetailView extends StatefulWidget {
  final OldUser? user;

  OldHeartBitDetailView(this.user);

  @override
  State<OldHeartBitDetailView> createState() => _OldHeartBitDetailViewState();
}

class _OldHeartBitDetailViewState extends State<OldHeartBitDetailView> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(
        title: "심박수",
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
                          child: Text("78", style: TextStyle(color: wTextBlackColor, fontSize: 20.sp, fontWeight: FontWeight.w600),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
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
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.only(left: 20.w, top: 20.h),
        //       child: Text(
        //         "심박수란?",
        //         style: TextStyle(
        //             color: wTextBlackColor,
        //             fontWeight: FontWeight.w600,
        //             fontSize: 14.sp),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         setState(() {
        //           isExpand = !isExpand;
        //         });
        //       },
        //       child: Container(
        //         margin: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
        //         child: Text(
        //           overflow: isExpand ? null : TextOverflow.ellipsis,
        //           HealthExplanation.HEART_EXPLANATION,
        //           style: TextStyle(
        //               color: wGrey600Color,
        //               fontWeight: FontWeight.w500,
        //               fontSize: 14.sp),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNormalInformation(),
                Container(
                  width: 145.w,
                ),
             //   _buildNormalInformation(),
              Container(
                width: 145.w,
              )
              //  _buildNormalInformation(),
               // _buildNormalInformation(),
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
                  "60~110",
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
      78,
      80,
      75,
      83,
      85,
      84,
      75,
      79,
      80,
      82,
      81,
      78,
      75,
      77,
      85,
      90,
      88,
      77,
      74,
      84,
      72,
      73,
      74,
      83
    ]);
  }
}
