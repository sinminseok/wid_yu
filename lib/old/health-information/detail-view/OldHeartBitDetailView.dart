

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/old/health-information/api/OldHealthApi.dart';
import 'package:wid_yu/old/health-information/detail-view/widgets/OldHealthGraph.dart';

import '../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/CustomText.dart';
import '../../../final-dto/old-dto/response/OldHealthDetailResponse.dart';

class OldHeartBitDetailView extends StatefulWidget {
  double currentHeartBit;


  OldHeartBitDetailView(this.currentHeartBit);

  @override
  State<OldHeartBitDetailView> createState() => _OldHeartBitDetailViewState();
}

class _OldHeartBitDetailViewState extends State<OldHeartBitDetailView> {
  bool isExpand = false;
  OldHealthDetailResponse? oldHealthDetailResponse;

  Future<bool> loadDeatilData() async{
    oldHealthDetailResponse = await OldHealthApi().loadDetailPage();
    if(oldHealthDetailResponse != null){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wYellow100Color,
      appBar: CommonAppBar(
        title: "심박수",
        color: wYellow100Color,
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(future: loadDeatilData(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Text("ERROR");
          }else{
            return Column(
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
                      _buildGraph(oldHealthDetailResponse),
                      _buildAvaeage(),
                    ],
                  ),
                ),
                _buildInformation(),
              ],
            );
          }
        },)
      ),
    );
  }

  Widget _buildAvaeage(){
    double value = oldHealthDetailResponse!.dailyAverage - widget.currentHeartBit;
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
                    // if(value != 0)Container(
                    //                     //   margin: EdgeInsets.only(bottom: 10.h),
                    //                     //   child: Text("평소보다", style: TextStyle(color: wGrey400Color, fontSize: 14.sp, fontWeight: FontWeight.w600),),
                    //                     // ),
                    if(value>0)_buildLow(),
                    if(value>0)_buildHigh(),
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
                          child: Text("${oldHealthDetailResponse?.dailyAverage}", style: TextStyle(color: wTextBlackColor, fontSize: 20.sp, fontWeight: FontWeight.w600),),
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

  Widget _buildLow(){
    double value = oldHealthDetailResponse!.dailyAverage - widget.currentHeartBit;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("${value}", style: TextStyle(color: wOrangeColor, fontSize: 20.sp, fontWeight: FontWeight.w600),),
        ),
        Container(
          margin: EdgeInsets.only(left: 5.w),
          child: Text("낮아요", style: TextStyle(color: wOrangeColor, fontSize: 14.sp),),
        )
      ],
    );
  }

  Widget _buildHigh(){
    double value =  widget.currentHeartBit - oldHealthDetailResponse!.dailyAverage;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("${value}", style: TextStyle(color: wOrangeColor, fontSize: 20.sp, fontWeight: FontWeight.w600),),
        ),
        Container(
          margin: EdgeInsets.only(left: 5.w),
          child: Text("높아요", style: TextStyle(color: wOrangeColor, fontSize: 14.sp),),
        )
      ],
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

  //todo 데이터 추가
  Widget _buildNormalInformation() {
    return Container(
      width: 145.w,
      height: 130.h,
      decoration: BoxDecoration(
        color: wWhiteBackGroundColor,
        borderRadius: BorderRadius.all(Radius.circular(6))
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


  Widget _buildGraph(OldHealthDetailResponse? oldHealthDetailResponse) {
    return oldHealthDetailResponse?.graphData == null?_buildEmptyGraph():OldHealthGraph(oldHealthDetailResponse!.graphData!);
  }

  Widget _buildEmptyGraph() {
    return Container(
      width: 330.w,
      height: 320.h,
      decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Center(
        child: Body2Text("오늘 심박수 측정을 아직 하지 않았습니다.", kTextBlackColor),
      ),
    );
    ;  }

}
