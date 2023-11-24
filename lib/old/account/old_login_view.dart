import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/utils/Color.dart';
import '../frame/OldFrameView.dart';

class OldLoginView extends StatefulWidget {
  const OldLoginView({Key? key}) : super(key: key);

  @override
  State<OldLoginView> createState() => _OldLoginViewState();
}

class _OldLoginViewState extends State<OldLoginView> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kTextBlackColor,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderText(),
            _buildPinCodeTextField(),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }



  Widget _buildHeaderText() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 60.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "부모님 계정으로 로그인해요.",
            style: TextStyle(
              color: kTextBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              "보호자 계정에서 생성된 초대숫자로 로그인해 주세요.",
              style: TextStyle(color: kTextBlackColor, fontSize: 15.sp),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    final TextStyle textStyle = TextStyle(color: Colors.black); // Custom text style with black color

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: PinCodeTextField(
        backgroundColor: Colors.transparent,
        length: 6,
        obscureText: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        textStyle: TextStyle(
          color: kTextBlackColor
        ),

        pinTheme: PinTheme(
          activeColor: Colors.transparent,
          errorBorderColor: Colors.orangeAccent,
          inactiveColor: Colors.transparent,
          disabledColor: wPurpleBackGroundColor,
          selectedColor: Colors.transparent,
          inactiveFillColor: Colors.grey.shade300,
          selectedFillColor: Color(0XffFFF8EE),
          borderWidth: 1,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          shape: PinCodeFieldShape.box,
          fieldHeight: 55.h,
          fieldWidth: 40.w,
          activeFillColor: Color(0XffFFF8EE),
        ),
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: _codeController,
        onCompleted: (v) {},
        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }





  Widget _buildLoginButton() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 300.h),
        child: SizedBox(
          width: 300.w,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {
              // Login button action
              setState(() {
                _codeController.clear();
              });
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: OldFrameView(0),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: wOrangeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "로그인",
              style: TextStyle(
                color: wWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
