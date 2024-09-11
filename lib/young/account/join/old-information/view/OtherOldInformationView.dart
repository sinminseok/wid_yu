import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/young/account/join/old-information/dto/OldLoginDto.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/DiseaseForm.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/OldInformationForm.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/SaveOldInformation.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/SelectHaveDisease.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../final-dto/old-dto/request/OldGeneratorRequest.dart';
import '../../controller/YoungJoinTotalController.dart';
import '../../finish/JoinSuccessView.dart';
import '../controller/OldInformationController.dart';

class OtherOldInformationView extends StatefulWidget {
  OldGeneratorRequest old;
  YoungJoinTotalController controller;

  OtherOldInformationView(this.old, this.controller);

  @override
  _OtherOldInformationView createState() => _OtherOldInformationView();
}

class _OtherOldInformationView extends State<OtherOldInformationView> {
  //final OldInformationController controller = OldInformationController();

  @override
  void initState() {
    widget.controller.oldNameController
        .addListener(widget.controller.updateNextStepState);
    widget.controller.ageController
        .addListener(widget.controller.updateNextStepState);
    widget.controller.oldPhoneNumberController
        .addListener(widget.controller.updateNextStepState);
    //controller.addressController.addListener(controller.updateNextStepState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SignUpAppBar(
        canBack: false,
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(2),
              SaveOldInformation(widget.old),
              _buildMainText(),
              OldInformationForm(controller: widget.controller),
              SelectHaveDisease(controller: widget.controller),
              DiseaseForm(controller: widget.controller),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 63.h, bottom: 10.h, left: 20.w),
      child: Title2Text("부모님의 계정을 생성해 주세요.", wGrey800Color),
    );
  }

  Widget _buildButton() {
    return Obx(() => widget.controller.canOldNextStep.value
        ? Center(
            child: InkWell(
              onTap: () async {
                OldGeneratorRequest newOld = widget.controller.createOld();
                List<OldLoginDto> olds = [];

                OldLoginDto? joinOld = await widget.controller.joinOld(newOld);
                OldLoginDto? joinOld2 =
                    await widget.controller.joinOld(widget.old);

                olds.add(joinOld!);
                olds.add(joinOld2!);


                if(joinOld == null || joinOld2 == null){
                  ToastMessage().showtoast("다시 시도해주세요.");
                }else{
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: (JoinSuccessView(
                              widget.controller.nameController.text,
                              widget.controller.phoneNumberController.text!,
                              widget.controller.idController.text!,
                              olds))));
                }

              },
              child: Container(
                  margin: EdgeInsets.only(top: 30.h, bottom: 60.h),
                  child: OrangeButton("다음")),
            ),
          )
        : Center(
            child: Container(
              width: 335.w,
              height: 44.h,
              margin: EdgeInsets.only(
                  top: 30.h, bottom: 60.h, right: 20.w, left: 20.w),
              decoration: BoxDecoration(
                  color: wGrey100Color,
                  border: Border.all(color: wGrey200Color),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: ButtonText("다음", wGrey400Color),
              ),
            ),
          ));
  }
}
