
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';

import '../../FinishConductView.dart';
import '../controller/DrugConductController.dart';

class DrugTakePhoto extends StatefulWidget {
  XFile xFile;
  GoalTimeResponse goalTimeResponse;
  DrugConductController _controller;

  DrugTakePhoto(this.xFile,this.goalTimeResponse ,this._controller);

  @override
  State<DrugTakePhoto> createState() => _DrugTakePhotoState();
}

class _DrugTakePhotoState extends State<DrugTakePhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '${widget._controller.goal.title}', color: wWhiteBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Title2Text("이 사진과 함께 목표 수행을 완료할까요?", kTextBlackColor),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 40.h,left: 13.w, right: 13.w),
                  width: 310.w,
                  height: 452.w,
                  decoration: BoxDecoration(
                      color: wGrey300Color,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Image.file(
                    File(widget.xFile.path),
                    fit: BoxFit.fitWidth,
                  )),
            ),
      Container(
        margin: EdgeInsets.only(bottom: 20.h),
        child: Column(
          children: [
          
            Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 335.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 108.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: wGrey300Color),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: wGrey200Color
                      ),
                      child: Center(
                        child: ButtonText("다시 찍기", wGrey600Color),
                      ),
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
                      onTap: ()async{
                        await widget._controller.successDrugGoal(widget.goalTimeResponse, widget.xFile);
                        //Get.offAll(() => FinishConductView());
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
        ),
      )
          ],
        ),
      ),
    );
  }
}
