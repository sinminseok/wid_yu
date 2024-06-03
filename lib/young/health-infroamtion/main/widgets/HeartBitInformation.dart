import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/old/health-information/dto/OldHealthResponse.dart';
import 'package:wid_yu/young/health-infroamtion/heartbit/view/HeartBitDetailView.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';
import '../../../../common/utils/constants/HealthInformation.dart';
import '../controller/YoungHealthInformationController.dart';
import '../../o2/view/O2DetailView.dart';

class HeartBitInformation extends StatefulWidget {
  OldHealthResponse user;


  HeartBitInformation(this.user);

  @override
  State<HeartBitInformation> createState() => _HeartBitInformationState();
}

class _HeartBitInformationState extends State<HeartBitInformation> with TickerProviderStateMixin {
  late AnimationController shakingController;

  @override
  void initState() {
    super.initState();
    shakingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true, period: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    shakingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

        onTap: (){
          Get.to(() => HeartBitDetailView(widget.user.userIdx), transition: Transition.fadeIn);
        },
        child: _buildHeartBitInformation());
  }

  Widget _buildHeartBitInformation(){
    double hb = widget.user.heartBit;
    if(60 < hb! && 100 > hb!){
      return _buildNormal();
    }else if((100 <= hb && hb < 120) || 30 <= hb && hb < 60){
      return _buildAttention();
    }
    return _buildDangerous();
  }


  Widget _buildNormal() {
    return _buildContainer(
      color: wWhiteBackGroundColor,
      borderColor: wGrey200Color,
      iconColor: wGrey800Color,
      messageColor: wGrey700Color,
      message: HealthInformationState.NOMAL.message,
      graph: _buildGraph(5, 0, 0),
    );
  }

  Widget _buildDangerous() {
    return _buildContainer(
      color: wError100Color,
      borderColor: wErrorColor,
      iconColor: wErrorColor,
      messageColor: wErrorColor,
      message: HealthInformationState.DANGEROUS.message,
      graph: _buildGraph(0, 0, 10),
    );
  }

  Widget _buildAttention() {
    return _buildContainer(
      color: wYellow100Color,
      borderColor: wYellowColor,
      iconColor: wGrey800Color,
      messageColor: wGrey800Color,
      message: HealthInformationState.ATTENTION.message,
      graph: Center(child: _buildGraph(0, 7, 0)),
    );
  }

  Widget _buildContainer({
    required Color color,
    required Color borderColor,
    required Color iconColor,
    required Color messageColor,
    required String message,
    required Widget graph,
  }) {
    return Container(
      width: 275.w,

      margin: EdgeInsets.only(left: 3.w, right: 12.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "심박수",
              style: TextStyle(
                color: wGrey700Color,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
          Container(
            width: 282.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.h,
                      margin: EdgeInsets.only(left: 9.w),
                      child: Image.asset(
                        "assets/young/health-information/heart.png",
                        width: 36.w,
                        height: 36.h,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.h, left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "${widget.user.heartBit}",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w900,
                                    color: iconColor,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2.h, left: 4.w),
                                child: Text(
                                  "bpm",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: iconColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: Text(
                              message,
                              style: TextStyle(
                                color: messageColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                graph,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGraph(int purpleCount, int yellowCount, int errorCount) {
    int totalRectangles = 10;
    int greyCount = totalRectangles - (purpleCount + yellowCount + errorCount);

    return Container(
      margin: EdgeInsets.only(right: 17.w),
      width: 60.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < purpleCount; i++) _buildRectangle(wPurpleColor),
          for (int i = 0; i < yellowCount; i++) _buildRectangle(wYellowColor),
          for (int i = 0; i < errorCount; i++) _buildShakingRectangle(wErrorColor),
          for (int i = 0; i < greyCount; i++) _buildRectangle(wGrey200Color),
        ],
      ),
    );
  }

  Widget _buildRectangle(Color color) {
    return Container(
      width: 5.w,
      height: 25.h,
      color: color,
    );
  }

  Widget _buildShakingRectangle(Color color) {
    return AnimatedBuilder(
      animation: shakingController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, shakingController.value * 10),
          child: Container(
            width: 5.w,
            height: 24.h,
            color: color,
          ),
        );
      },
    );
  }
}
