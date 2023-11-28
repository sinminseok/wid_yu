import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/common-widget/OrangeButton.dart';
import '../../../frame/YoungFrameView.dart';
import '../controller/YoungLoginController.dart';

class LoginButton extends StatelessWidget {
  final YoungLoginController controller;


  LoginButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => YoungFrameView(0), transition: Transition.fadeIn);
      },
      child: Container(
          margin: EdgeInsets.only(top: 0.h),
          child: OrangeButton(
            '로그인',
          )),
    );
  }
}
