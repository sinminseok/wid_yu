import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungLoginController.dart';

class LoginTextForm extends StatelessWidget {
  final YoungLoginController controller;

  LoginTextForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335.w,
          margin: EdgeInsets.only(top: 58.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: controller.isWrongInformation
                          ? wErrorColor
                          : wBorderGrey300Color,
                      width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    controller: controller.idController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "아이디",
                      hintStyle:
                          TextStyle(color: wGrey300Color, fontSize: 14.sp),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              ),
              controller.isWrongInformation
                  ? Container(
                      margin: EdgeInsets.only(top: 5.h, left: 5.w),
                      child: Text(
                        "아이디를 다시 입력해 보세요.",
                        style: TextStyle(color: wErrorColor, fontSize: 14.sp),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        Container(
          width: 335.w,
          margin: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: controller.isWrongInformation
                          ? wErrorColor
                          : wBorderGrey300Color,
                      width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // 힌트 텍스트와 입력란 간의 간격 조정
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextFormField(
                        controller: controller.passworController,
                        obscureText: controller.obscurePassword,
                        style: TextStyle(color: Colors.black),
                        // 텍스트 색상을 검정색으로 설정
                        textAlign: TextAlign.left,
                        // 텍스트를 왼쪽으로 정렬
                        cursorColor: kTextBlackColor,
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          hintStyle:
                              TextStyle(color: wGrey300Color, fontSize: 14.sp),
                          border: InputBorder.none,
                          isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.changeObscurePassword();
                        },
                        icon: Icon(
                          controller.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              controller.isWrongInformation
                  ? Container(
                      margin: EdgeInsets.only(top: 0.h, left: 5.w),
                      child: Text(
                        "비밀번호를 다시 입력해 보세요.",
                        style: TextStyle(color: wErrorColor, fontSize: 14.sp),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ],
    );
  }
}
