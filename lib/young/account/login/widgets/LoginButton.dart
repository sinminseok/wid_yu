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
    return Container(
          margin: EdgeInsets.only(top: 60.h),
          child: InkWell(
            onTap: (){
              Get.to(() => YoungFrameView(0), transition: Transition.fadeIn);
            },
            child: OrangeButton(
              '로그인',
            ),
          )
    );
  }
}
