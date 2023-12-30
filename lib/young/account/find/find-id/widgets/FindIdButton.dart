

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/account/find/find-id/controller/FindIdController.dart';

import '../../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/CustomText.dart';
import '../../../join/phone-vertify/VertifyPhoneView.dart';
import '../view/FindIdSuccessView.dart';

class FindIdButton extends StatelessWidget {

  FindIdController controller;


  FindIdButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSuccessFind == -1?_buildRetryButton():_buildFindButton());
  }

  Widget _buildFindButton(){
    return Container(
        margin: EdgeInsets.only(top: 212.h),
        child: InkWell(
            onTap: () {
              controller.findId();
            },
            child: OrangeButton("아이디 찾기")));
  }

  Widget _buildRetryButton() {
    return Container(
      margin: EdgeInsets.only(top: 80.h),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Get.to(() => VerificationPhoneView());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: ButtonText("회원 가입하러 가기 ", wPurpleColor)
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios_outlined, color: wPurpleColor,size: 15.sp,),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Get.to(() => FindIdSuccessView());
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: OrangeButton("다시찾기")))
        ],
      ),
    );
  }
}
