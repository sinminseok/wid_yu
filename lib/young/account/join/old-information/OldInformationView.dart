import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/DiseaseForm.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/NextButton.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/OldInformationForm.dart';
import 'package:wid_yu/young/account/join/old-information/widgets/SelectHaveDisease.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../../common/model/disease/Disease.dart';
import '../../../../common/model/user/Old.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/PopUp.dart';
import '../../../../common/utils/exception/InvalidInformationException.dart';
import '../../../../common/utils/widgets/TextFormWidget.dart';
import '../../popup/AcoountPopup.dart';

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
    controller.phoneNumberController.addListener(controller.updateNextStepState);
    controller.addressController.addListener(controller.updateNextStepState);
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
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
      margin: EdgeInsets.only(top: 30.h, bottom: 10.h, left: 15.w),
      child: Text(
        "부모님의 정보를 대신 입력해 주세요.",
        style: TextStyle(
            color: wGrey800Color, fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  
}
