import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/AgreeJoin.dart';
import 'package:wid_yu/young/account/join/phone-vertify/widgets/NameAndPhoneNumber.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';

import '../../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../../common/utils/Color.dart';
import '../../controller/YoungJoinTotalController.dart';
import '../../young-join/view/YoungJoinView.dart';
import '../popup/JoinAgreePopup.dart';

//
class VerificationPhoneView extends StatefulWidget {
  @override
  State<VerificationPhoneView> createState() => _VerificationPhoneViewState();
}

class _VerificationPhoneViewState extends State<VerificationPhoneView> {
  YoungJoinTotalController controller = YoungJoinTotalController();

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
              controller,
            ),
            AgreeJoin(controller),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    //todo 리패토링
    return Obx(() => !controller.canNextStep
        ? Center(
            child: Container(
                margin: EdgeInsets.only(top: 25.h, bottom: 0.h),
                child: InkWell(
                    onTap: () {

                      Get.offAll(() => YoungJoinView(controller));
                      //todo 테스트 되면 이거로 변경
                      // if (controller.agree) {
                      //   Get.offAll(() => YoungJoinView());
                      // } else {
                      //   JoinAgreePopup().showDialog(context);
                      // }
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
