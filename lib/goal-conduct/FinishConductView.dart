

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/button/PurpleButton.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';

class FinishConductView extends StatelessWidget {
  bool isOld;


  FinishConductView(this.isOld);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 169.h),
                  width: 213.w,
                  height: 197.h,
                  child: Image.asset("assets/images/mission/best.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 55.h),
                child: Title1Text("수행완료!", wGrey700Color),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: SubTitle2Text("꾸준하게 복용해서 얼른 나아요", wGrey600Color),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60.h),
            child: InkWell(
                onTap: (){
                  if(isOld){
                    Get.offAll(() => OldFrameView(0));
                  }else{
                    Get.offAll(() => YoungFrameView(0));
                  }

                },
                child: PurpleButton("확인")),
          )
        ],
      ),
    );
  }
}
