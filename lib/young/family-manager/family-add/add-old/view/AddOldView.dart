import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/controller/AddOldController.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/widgets/AddDiseaseForm.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/widgets/AddNextButton.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/widgets/AddOldInformationForm.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/widgets/AddSelectHaveDisease.dart';

import '../../../../../common/common-widget/CommonAppbar.dart';
import '../../../../../common/utils/Color.dart';

class AddOldView extends StatefulWidget {
  const AddOldView({Key? key}) : super(key: key);

  @override
  _AddOldViewState createState() => _AddOldViewState();
}

class _AddOldViewState extends State<AddOldView> {
  AddOldController controller = AddOldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(canBack: true, title: '보호자 추가', color: wWhiteColor,),
      body: SingleChildScrollView(
        physics : BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainText(),
            AddOldInformationForm(controller: controller),
            AddSelectHaveDisease(controller: controller),
            AddDiseaseForm(controller: controller,),
            AddNextButton(controller, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainText(){
    return Container(
      margin: EdgeInsets.only(top: 30.h,left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Title2Text("부모님을 추가하기 위해 ", wGrey800Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h
            ),
            child: Title2Text("부모님의 계정을 생성해 주세요.", wGrey800Color),
          ),
        ],
      ),
    );
  }
}
