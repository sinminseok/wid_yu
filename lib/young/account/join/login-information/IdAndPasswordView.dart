import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/account/join/finish/JoinSuccessView.dart';
import 'package:wid_yu/young/account/join/login-information/controller/JoinIdPasswordController.dart';
import 'package:wid_yu/young/account/join/login-information/widgets/IdPasswordForm.dart';
import 'package:wid_yu/young/account/join/login-information/widgets/SelectButton.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../../common/model/account/AwsServices.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/PopUp.dart';
import '../../../../common/utils/exception/InvalidInformationException.dart';
import '../../../utils/RegConstants.dart';
import '../old-information/OldInformationView.dart';

class IdAndPasswordView extends StatelessWidget {
  const IdAndPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JoinIdPasswordController controller = JoinIdPasswordController();
    return Scaffold(
      appBar: SignUpAppBar(
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(1),
              _buildHeaderText(),
              IdPasswordForm(controller),
              SelectButton(controller: controller)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h),
      child: Text(
        "사용하실 아이디와 비밀번호를\n설정해주세요.",
        style: TextStyle(
          color: kTextBlackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
