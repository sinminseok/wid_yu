
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/widgets/TextFormWidget.dart';

class DiseaseForm extends StatelessWidget {
  final OldInformationController controller;


  DiseaseForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isDisease == true
        ? Center(
      child: Container(
        margin: EdgeInsets.only(top: 0.h),
        width: 340.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 0.h),
                child: TextFormWidget(
                  textEditingController: controller.diseaseNameController,
                  title: '질병이름(필수)',
                  isIntType: false,
                  hintText: '12',
                )),
            TextFormWidget(
              textEditingController: controller.drugNameController,
              title: '복용중인 약(선택)',
              isIntType: false,
              hintText: '12',
            ),
            Container(
              margin: EdgeInsets.only(left: 0.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "설명(선택)",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 335.w,
                    height: 140.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: wGrey300Color),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 5.h, left: 10.w),
                      child: TextFormField(
                        controller: controller.drugInformationController,
                        style: TextStyle(color: Colors.black),
                        // 텍스트 색상을 검정색으로 설정
                        textAlign: TextAlign.left,
                        // 텍스트를 왼쪽으로 정렬
                        cursorColor: kTextBlackColor,
                        decoration: InputDecoration(
                          hintText:
                          "질병에 관련된 자세한 설명이나\n응급상황시 구조자가 알아야 하는 설명을 적어주세요.",
                          hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey.shade500),
                          border: InputBorder.none,
                          isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                        ),
                        maxLines: null,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     try{
            //       checkDiseaseAnswer();
            //       var disease = Disease(_diseaseNameController.text,
            //           _drugNameController.text, _introduceController.text);
            //       diseases.add(disease);
            //       setState(() {
            //         canAddDisease = !canAddDisease;
            //         resetController();
            //       });
            //     }catch (e) {
            //       if (e is InvalidInformationException) {
            //         ToastMessage().showtoast(e.cause);
            //       }
            //     }
            //
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(top: 20.h, bottom: 30.h,right: 0.w),
            //
            //     child: Center(
            //       child: Text(
            //         "질병 추가 +",
            //         style: TextStyle(color: kTextBlackColor),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    )
        : Container());
  }
}
