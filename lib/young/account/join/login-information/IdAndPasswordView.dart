import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/common/common-widget/CommonAppbar.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/account/join/login-information/widgets/IdPasswordForm.dart';
import 'package:wid_yu/young/account/join/login-information/widgets/SelectButton.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungJoinController.dart';

class IdAndPasswordView extends StatelessWidget {
  YoungJoinController controller;


  IdAndPasswordView(this.controller);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(canBack: true, title: "", color: wWhiteColor),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(1),
              _buildHeaderText(),
              IdPasswordForm(controller),
              //here
              Obx(() {
                return controller.canSelectButton ? SelectButton(controller: controller) : SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(left: 15.w, top: 28.h),
      child: Title2Text("사용하실 아이디와 비밀번호를\n설정해주세요.", wGrey800Color));
  }
}
