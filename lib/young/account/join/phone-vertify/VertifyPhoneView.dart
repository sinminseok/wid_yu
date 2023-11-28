import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/account/join/phone-vertify/controller/VertifyPhoneController.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/NameAndPhoneNumber.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/NextButton.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../../common/common-widget/OrangeButton.dart';
import '../../../../common/utils/Color.dart';
import '../login-information/IdAndPasswordView.dart';

class VerificationPhoneView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final VerificationPhoneController controller = VerificationPhoneController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SignUpAppBar(
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(1),
            _buildMainText(),
            NameAndPhoneNumber(controller: controller,),
            NextButton(controller)
          ],
        ),
      ),
    );
  }


  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h,left: 20.w,),
      child: Text(
        "보호자님의 본인인증을 해주세요.",
        style: TextStyle(
            color: wGrey800Color, fontWeight: FontWeight.w800, fontSize: 20.sp),
      ),
    );
  }
}
