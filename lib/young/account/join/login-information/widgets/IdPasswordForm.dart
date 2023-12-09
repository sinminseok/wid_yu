import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../../../../../common/utils/Color.dart';
import '../../controller/YoungJoinController.dart';

class IdPasswordForm extends StatelessWidget {
  final YoungJoinController controller;

  IdPasswordForm(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
          child: Column(
            children: [
              _buildIdForm(),
              _buildPasswordForm(),
            ],
          ),
        ));
  }

  Widget _buildIdForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 21.h, child: SubTitle2Text("아이디", wGrey700Color)),
        Stack(
          children: [
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                    color: controller.checkDuplicateId == 0
                        ? wGrey300Color
                        : controller.checkDuplicateId == 1
                            ? wPurpleColor
                            : wErrorColor),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 5.h, left: 10.w),
                child: TextFormField(
                  onChanged: (text) {
                    controller.checkCanSelectButton();
                    controller.checkReTryId();
                  },
                  controller: controller.idController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,

                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.h),
                    hintText: "영문, 숫자를 조합하여 6~12자",
                    hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade500,
                        fontFamily: "hint"),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
            Positioned(
                top: 23.h,
                left: 250.w,
                child: controller.checkDuplicateId == 0
                    ? Container(
                        child: InkWell(
                            onTap: () {
                              controller.checkDuplicateIdFunction();
                            },
                            child: ButtonText("중복확인", wPurpleColor)),
                      )
                    : Container(
                        child: ButtonText("중복확인", wGrey400Color),
                      ))
          ],
        ),
        controller.checkDuplicateId == 0
            ? Container()
            : controller.checkDuplicateId == 1
                ? Container(
                    margin: EdgeInsets.only(top: 4.h),
                    child: HelperText("사용할 수 있는 아이디에요!", wPurpleColor),
                  )
                : controller.checkDuplicateId == 2
                    ? Container(
                        margin: EdgeInsets.only(top: 4.h),
                        child: HelperText("아이디 형식 조건이 충족되지 않았어요.", wErrorColor),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 4.h),
                        child: HelperText("중복된 아이디에요!", wErrorColor),
                      )
      ],
    );
  }

  Widget _buildPasswordForm() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 21.h,
                margin: EdgeInsets.only(top: 13.h),
                child: SubTitle2Text("비밀번호", wGrey700Color)),
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 6.h),
              decoration: BoxDecoration(
                border: Border.all(
                    color: controller.isRightPassword == -1
                        ? wErrorColor
                        : wGrey300Color),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 5.h, left: 10.w),
                child: TextFormField(
                  controller: controller.passwordController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,
                  onChanged: (text) {
                    controller.validateRightPassword();
                    controller.checkCanSelectButton();
                  },
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.h),
                    hintText: "영문, 숫자, 특수기호를 조합하여 8~12자.",
                    hintStyle:
                        TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
            controller.isRightPassword == -1
                ? Container(
                    margin: EdgeInsets.only(top: 6.h),
                    height: 19.h,
                    child: HelperText("비밀번호 형식 조건이 충족되지 않았어요", wErrorColor),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 6.h),
                    height: 19.h,
                  )
          ],
        ));
  }
}
