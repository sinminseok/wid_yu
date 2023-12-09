import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
      appBar: AppBar(
        backgroundColor: wWhiteColor,
        elevation: 0,
        automaticallyImplyLeading: false, // 이전 화면으로 자동으로 이동하지 않도록 설정
        leading: PreferredSize(
          preferredSize: Size.fromHeight(40.h), // 아이콘의 높이 설정
          child: Container(
            margin: EdgeInsets.only(top: 20.h,),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined, // 사용할 아이콘
                color: Colors.black, // 아이콘 색상
              ),
              onPressed: () {
                controller.disposeInAndPassword();
                Navigator.pop(context);
                // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
              },
            ),
          ),
        ),
      ),
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
