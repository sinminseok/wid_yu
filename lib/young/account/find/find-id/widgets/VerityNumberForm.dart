import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/account/find/find-id/controller/FindIdController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/FilePath.dart';

class VerityNumberForm extends StatelessWidget {
  FindIdController controller;

  VerityNumberForm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSendNumber
        ? _buildNumberForm()
        : Container(
            height: 150.h,
          ));
  }

  Widget _buildNumberForm() {
    return Container(
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 63.h),
            child: Container(
                height: 21.h,
                margin: EdgeInsets.only(top: 0.h),
                child: SubTitle2Text("인증번호", wGrey700Color)),
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wBorderGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.verifyNumberController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: TextStyle(
                          color: wGrey300Color,
                          fontFamily: "hint",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 20.h,
                  right: 10.w,
                  child: InkWell(
                    onTap: () {
                      print("dasd");
                    },
                    child: Container(child: ButtonText("확인", wPurpleColor)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
