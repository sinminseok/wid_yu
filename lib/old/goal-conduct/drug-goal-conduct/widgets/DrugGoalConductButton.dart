
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/goal-conduct/FinishConductView.dart';
import 'package:wid_yu/old/goal-conduct/drug-goal-conduct/controller/OldDrugConductController.dart';

class DrugGoalConductButton extends StatelessWidget {

  OldDrugConductController controller;


  DrugGoalConductButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100.h),
          height: 24.h,
          child: ButtonText("다시 알림", wPurpleColor),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 335.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 108.w,
                height: 44.h,
                decoration: BoxDecoration(
                  border: Border.all(color: wGrey300Color),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: wGrey200Color
                ),
                child: Center(
                  child: ButtonText("끄기", wGrey600Color),
                ),
              ),
              Container(
                width: 221.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: wOrangeColor,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: Border.all(color: wOrange200Color)
                ),
                child: InkWell(
                  onTap: (){
                    Get.offAll(() => FinishConductView());
                  },
                  child: Center(
                    child: ButtonText("복용 사진 찍어서 완료하기", wWhiteColor),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
