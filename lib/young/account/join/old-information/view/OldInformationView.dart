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
import '../../controller/YoungJoinTotalController.dart';

class OldInformationView extends StatefulWidget {
  YoungJoinTotalController controller;


  OldInformationView(this.controller);

  @override
  _OldInformationView createState() => _OldInformationView();
}

class _OldInformationView extends State<OldInformationView> {

  @override
  void initState() {
    widget.controller.oldNameController.addListener(widget.controller.updateNextStepState);
    widget.controller.ageController.addListener(widget.controller.updateNextStepState);
    widget.controller.oldPhoneNumberController
        .addListener(widget.controller.updateNextStepState);
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
                OldInformationForm(controller: widget.controller),
                SelectHaveDisease(controller: widget.controller),
                DiseaseForm(controller: widget.controller),
                NextButton(widget.controller, context)
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
