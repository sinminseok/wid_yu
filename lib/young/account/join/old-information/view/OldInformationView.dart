import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/DiseaseForm.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/NextButton.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/OldInformationForm.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/SelectHaveDisease.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';

import '../../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../../common/utils/Color.dart';

class OldInformationView extends StatefulWidget {
  const OldInformationView({Key? key}) : super(key: key);

  @override
  _OldInformationView createState() => _OldInformationView();
}

class _OldInformationView extends State<OldInformationView> {
  final OldInformationController controller = OldInformationController();

  @override
  void initState() {
    controller.nameController.addListener(controller.updateNextStepState);
    controller.ageController.addListener(controller.updateNextStepState);
    controller.phoneNumberController
        .addListener(controller.updateNextStepState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(canBack: true, title: "", color: wWhiteColor),
      body: Container(
        child: GestureDetector(
          child: SingleChildScrollView(
            physics : BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(2),
                _buildMainText(),
                OldInformationForm(controller: controller),
                SelectHaveDisease(controller: controller),
                DiseaseForm(controller: controller),
                NextButton(controller, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(top: 30.h, bottom: 10.h, left: 15.w),
      child: Title2Text("부모님의 계정을 생성해 주세요.", wGrey800Color),
    );
  }
}
