import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/join/controller/YoungJoinController.dart';
import 'package:wid_yu/young/account/join/phone-vertify/controller/VertifyPhoneController.dart';
import 'package:wid_yu/young/account/join/phone-vertify/popup/JoinAgreePopup.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/AgreeJoin.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/NameAndPhoneNumber.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';

import '../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../common/utils/Color.dart';
import '../login-information/IdAndPasswordView.dart';

class VerificationPhoneView extends StatefulWidget {
  @override
  State<VerificationPhoneView> createState() => _VerificationPhoneViewState();
}

class _VerificationPhoneViewState extends State<VerificationPhoneView> {
  YoungJoinController controller = YoungJoinController();

  VerificationPhoneController  verificationPhoneController = VerificationPhoneController();

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
              verificationPhoneController,
            ),
            AgreeJoin(verificationPhoneController),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Obx(() => verificationPhoneController.canInputVertifyNumber
        ? Center(
            child: Container(
                margin: EdgeInsets.only(top: 25.h, bottom: 0.h),
                child: InkWell(
                    onTap: () {
                      if(verificationPhoneController.agree){
                        controller.saveNameAndPhoneNumber(verificationPhoneController.nameController.text, verificationPhoneController.phoneNumberController.text);
                        Get.to(() => IdAndPasswordView(controller),
                            transition: Transition.fadeIn);
                      }else{
                        JoinAgreePopup().showDialog(context);
                      }

                    },
                    child: OrangeButton("다음"))))
        : Container());
  }

  Widget _buildMainText() {
    return Container(
        height: 30.h,
        margin: EdgeInsets.only(
          top: 42.h,
          left: 20.w,
        ),
        child: Title2Text("보호자님의 본인인증을 해주세요.", wGrey800Color));
  }
}
