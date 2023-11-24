import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/account/login/widgets/LoginFormWidget.dart';
import '../../../common/utils/Color.dart';
import '../find/find-id/FindIdView.dart';
import '../find/find-password/FindPasswordView.dart';
import '../join/VertifyPhoneView.dart';

class YoungLoginView extends StatefulWidget {
  const YoungLoginView({Key? key}) : super(key: key);

  @override
  _YoungLoginView createState() => _YoungLoginView();
}

class _YoungLoginView extends State<YoungLoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kTextBlackColor, //change your color here
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined, // 변경하려는 아이콘
            color: kTextBlackColor, // 변경하려는 아이콘 색상
          ),
          onPressed: () {
            // 뒤로가기 버튼을 눌렀을 때 수행할 동작
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMainText(),
            LoginFormWidget(),
            _buildSearchInformation(),
            _buildSignUpText()
          ],
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 28.h),
            child: Text(
              "보호자 계정으로 로그인해요",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: kTextBlackColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Text(
              "부모님 계정 생성은 보호자 계정에서 가능해요.",
              style: TextStyle(fontSize: 14.sp, color: kTextGreyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchInformation() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 190.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: (FindIdView())));
              },
              child: Container(
                child: Text(
                  "아이디 찾기",
                  style: TextStyle(
                      color: wGrey600Color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 20.h,
              color: wGreyColor,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: (FindPasswordView())));
              },
              child: Container(
                child: Text(
                  "비밀번호 찾기",
                  style: TextStyle(
                      color: wGrey600Color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpText() {
    return Container(
      margin: EdgeInsets.only(top: 120.h),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: (VerifyPhoneView())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "회원가입 하러가기",
                style: TextStyle(
                    color: wPurpleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              Container(
                child: Icon(
                  Icons.navigate_next_outlined,
                  color: wPurpleColor,
                ),
              )
            ],
          )),
    );
  }
}
