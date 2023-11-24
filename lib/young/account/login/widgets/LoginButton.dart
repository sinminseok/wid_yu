import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/common-widget/OrangeButton.dart';
import '../controller/YoungLoginController.dart';

class LoginButton extends StatelessWidget {
  final YoungLoginController controller;


  LoginButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.test();
        //validateInforamtion();
        // login(_idController.text, _passworController.text);
        // Navigator.push(
        //     context,
        //     PageTransition(
        //         type: PageTransitionType.fade, child: (YoungFrameView(0))));
      },
      child: Container(
          margin: EdgeInsets.only(top: 0.h),
          child: OrangeButton(
            '로그인',
          )),
    );
  }
}
