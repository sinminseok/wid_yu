import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/CommonAppbar.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/account/join/controller/YoungJoinController.dart';
import 'package:wid_yu/young/account/join/phone-vertify/controller/VertifyPhoneController.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/AgreeJoin.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/NameAndPhoneNumber.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/NextButton.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../../common/common-widget/OrangeButton.dart';
import '../../../../common/utils/Color.dart';
import '../login-information/IdAndPasswordView.dart';

class VerificationPhoneView extends StatelessWidget {
  YoungJoinController controller = YoungJoinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: wWhiteColor,
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(
        canBack: true,
        title: "",
        color: wWhiteColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(1),
            _buildMainText(),
            NameAndPhoneNumber(
              controller: controller,
            ),
            AgreeJoin(controller),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Obx(() => controller.canInputVertifyNumber
        ? Center(
            child: Container(
                margin: EdgeInsets.only(top: 19.h, bottom: 60.h),
                child: InkWell(
                    onTap: () {
                      Get.to(() => IdAndPasswordView(controller),
                          transition: Transition.fadeIn);
                    },
                    child: OrangeButton("다음"))))
        : Container());
  }

  Widget _buildMainText() {
    return Container(
        height: 30.h,
        margin: EdgeInsets.only(
          top: 30.h,
          left: 20.w,
        ),
        child: Title2Text("보호자님의 본인인증을 해주세요.", wGrey800Color));
  }
}
