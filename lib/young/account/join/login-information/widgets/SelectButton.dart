
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wid_yu/young/account/join/login-information/controller/JoinIdPasswordController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/PopUp.dart';
import '../../../../../common/utils/exception/InvalidInformationException.dart';
import '../../finish/JoinSuccessView.dart';
import '../../old-information/OldInformationView.dart';

class SelectButton extends StatelessWidget {
  final JoinIdPasswordController controller;


  SelectButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 190.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                try {
                  Get.to(() => JoinSuccessView(),
                      transition: Transition.fadeIn);
                  // validateInformation(
                  //     _idController.text, _passwordController.text);
                  // signup(_idController.text, _passwordController.text);

                } catch (e) {
                  if (e is InvalidInformationException) {
                    ToastMessage().showtoast(e.cause);
                  }
                }
              },
              child: Container(
                width: 108.w,
                height: 44.h,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text("내 계정만 생성", style: TextStyle(fontSize: 15.sp,color: Colors.grey.shade800),),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => OldInformationView(),
                    transition: Transition.fadeIn);
              },
              child: Container(
                width: 221.w,
                height: 44.h,
                decoration: BoxDecoration(
                    color: wOrangeColor,
                    border: Border.all(color: Colors.orangeAccent),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text("계속해서 부모님 계정 생성",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                ),
              ),
            ),
          ],
        ));
  }
}
