import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wid_yu/old/account/controller/OldLoginController.dart';

import '../../../common/common-widget/button/OrangeButton.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/CustomText.dart';

class CodeForm extends StatefulWidget {
  OldLoginController controller;

  CodeForm(this.controller);

  @override
  State<CodeForm> createState() => _CodeFormState();
}

class _CodeFormState extends State<CodeForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _testController = TextEditingController();

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: PinCodeTextField(
                backgroundColor: Colors.transparent,
                length: 7,
                obscureText: false,
                //keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                textStyle: TextStyle(
                    fontFamily: "LargeTitle",
                    fontSize: 40.sp,
                    color: kTextBlackColor),
                pinTheme: PinTheme(
                  activeColor: widget.controller.canNextStep == -1
                      ? wErrorColor
                      : Colors.transparent,
                  //activeColor: wOrangeColor,
                  //controller.canNextStep == 1 ?wErrorColor :
                  errorBorderColor: wErrorColor,
                  inactiveColor: wGrey200Color,

                  selectedColor: Colors.transparent,
                  inactiveFillColor: wGrey100Color,
                  selectedFillColor: Color(0XffFFF8EE),
                  activeBorderWidth: 1.sp,
                  borderWidth: 1.sp,
                  disabledBorderWidth: 1.sp,
                  inactiveBorderWidth: 1.sp,
                  errorBorderWidth: 1.sp,
                  selectedBorderWidth: 1.sp,

                  borderRadius: widget.controller.canNextStep == 1
                      ? BorderRadius.all(Radius.circular(5))
                      : BorderRadius.all(Radius.circular(5)),
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 70.h,
                  fieldWidth: 40.w,
                  activeFillColor: Color(0XffFFF8EE),
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: _testController,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
            ),
            widget.controller.canNextStep == -1
                ? Container(
                    height: 40.h,
                    margin: EdgeInsets.only(left: 20.w),
                    child: Helper2Text("숫자를 다시 입력해 보세요.", wErrorColor),
                  )
                : Container(
                    height: 40.h,
                  ),
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 320.h),
                  child: InkWell(
                      onTap: () {
                        OldLoginController().loginOld(_testController.text);
                      },
                      child: OrangeButton("로그인"))),
            )
          ],
        ));
  }

// Widget _buildLoginButton() {
//   return Center(
//     child: Container(
//         padding: EdgeInsets.only(top: 320.h),
//         child: InkWell(
//             onTap: () {
//               OldLoginController().loginOld(_te);
//             },
//             child: OrangeButton("로그인"))),
//   );
// }
}
