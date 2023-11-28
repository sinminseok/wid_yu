import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/account/join/login-information/controller/JoinIdPasswordController.dart';

import '../../../../../common/utils/Color.dart';

class IdPasswordForm extends StatelessWidget {
  final JoinIdPasswordController controller;

  IdPasswordForm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 30.h),
              child: Text(
                "아이디",
                style: TextStyle(
                    color: kTextBlackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 335.w,
                  height: 46.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: wGrey300Color),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.h, left: 10.w),
                    child: TextFormField(
                      controller: controller.idController,
                      style: TextStyle(color: Colors.black),
                      // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.left,
                      // 텍스트를 왼쪽으로 정렬
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "이메일 형식으로 입력해주세요.",
                        hintStyle: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade500),
                        border: InputBorder.none,
                        isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 15.h),
              child: Text(
                "비밀번호",
                style: TextStyle(
                    color: kTextBlackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 335.w,
                  height: 46.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: wGrey300Color),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.h, left: 10.w),
                    child: TextFormField(
                      controller: controller.passwordController,
                      style: TextStyle(color: Colors.black),
                      // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.left,
                      // 텍스트를 왼쪽으로 정렬
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "영문, 숫자, 특수기호를 조합하여 8~12자.",
                        hintStyle: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade500),
                        border: InputBorder.none,
                        isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
