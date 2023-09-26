import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kTextBlackColor,
          ),
          elevation: 0,
          backgroundColor: kBackgroundColor,
        ),
        backgroundColor: kBackgroundColor,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w, top: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "초대코드로 로그인",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "부양자 계정에서 생성된 초대코드를 입력해 로그인 해주세요.",
                        style: TextStyle(color: kTextBlackColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              width: 300.w,
                              child: PinCodeTextField(
                                cursorColor: kBackgroundColor,
                                backgroundColor: Colors.transparent,
                                length: 6,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  activeColor: Colors.transparent,
                                  inactiveColor: Colors.transparent,
                                  disabledColor: kBackgroundColor,
                                  selectedColor: Colors.transparent,
                                  inactiveFillColor: Colors.grey,
                                  selectedFillColor: Colors.grey,
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(20),
                                  fieldHeight: 40,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.grey,
                                ),
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                controller: _codeController,
                                onCompleted: (v) {},
                                onChanged: (value) {},
                                beforeTextPaste: (text) {
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                                appContext: context,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Container(
                  width: 300.w,
                  height: 50.h,
                  margin: EdgeInsets.only(bottom: 30.h),
                  decoration: BoxDecoration(
                      color: kTextBlackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                            color: kTextWhiteColor, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ]));
  }
}
