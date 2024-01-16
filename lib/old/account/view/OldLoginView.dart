import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/test-controller/TestController.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/account/controller/OldLoginController.dart';
import 'package:wid_yu/old/account/widgets/CodeForm.dart';

import '../../../common/utils/Color.dart';
import '../../frame/OldFrameView.dart';

class OldLoginView extends StatefulWidget {



  @override
  State<OldLoginView> createState() => _OldLoginViewState();
}

class _OldLoginViewState extends State<OldLoginView> {
  OldLoginController controller = OldLoginController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "", color: wWhiteColor,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _buildHeaderText(),
                  CodeForm(controller),
                ],
              ),
              _buildLoginButton(),
            ],
          )),
    );
  }

  Widget _buildHeaderText() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 60.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Title2Text("부모님 계정으로 로그인해요.", wGrey800Color),
          SizedBox(height: 10.h),
          Center(
            child: Body1Text("보호자 계정에서 생성된 초대숫자로 로그인해 주세요.", wGrey600Color),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
  

  Widget _buildLoginButton() {
    return Center(
      child: Container(
          padding: EdgeInsets.only(top: 320.h),
          child: InkWell(
              onTap: () {
                //controller.validateNextStep();
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: OldFrameView(0),
                  ),
                );
              },
              child: OrangeButton("로그인"))),
    );
  }
}
