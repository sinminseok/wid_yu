import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../old/account/old_login_view.dart';
import '../../../young/account/login/YoungLoginView.dart';
import '../../utils/Color.dart';
import '../../utils/FilePath.dart';

class SelectUserView extends StatefulWidget {
  @override
  State<SelectUserView> createState() => _SelectUserViewState();
}

class _SelectUserViewState extends State<SelectUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            _buildMainText(),
            _buildYoungButton(),
            _buildOldButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOldButton(){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: OldLoginView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 339.w,
                height: 168.h,
                decoration: BoxDecoration(
                  color: wOrangeBackGroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 110.w,
                          height: 95.h,
                          margin: EdgeInsets.only(left: 30.w),
                          child: Image.asset(commonImagePath + "user/oldMan.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "부모님",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24.sp,
                      color: wTextBlackColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "부모님으로 로그인해요.\n회원가입은 보호자님이 해주세요.",
                    style: TextStyle(fontSize: 14.sp, color: kTextBlackColor),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildYoungButton(){
    return Container(margin: EdgeInsets.only(top: 56.h),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: YoungLoginView(),
            ),
          );
        },
        child: Stack(
          children: [
            Center(
              child: Container(

                width: 339.w,
                height: 168.h,
                decoration: BoxDecoration(
                  color: wPurpleBackGroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 110.w,
                          height: 95.h,
                          margin: EdgeInsets.only(left: 30.w),
                          child: Image.asset(commonImagePath + "user/youngManBox.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "보호자",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24.sp,
                      color: wTextBlackColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "보호자로 회원가입,로그인하여\n부모님의 정보를 관리해요",
                    style: TextStyle(fontSize: 14.sp, color: kTextBlackColor),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 93.h),
        width: 110.w,
        height: 35.h,
        child: Image.asset("assets/common/common/appbar_logo.png"),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Container(
            child: Text(
              "건강한 습관과 소통의 형성",
              style: TextStyle(fontSize: 14.sp, color: wGreyColor),
            ),
          ),
          Container(
            child: Text(
              "가족과, 그리고 위듀와 함께해요.",
              style: TextStyle(fontSize: 14.sp, color: wGreyColor),
            ),
          ),
        ],
      ),
    );
  }

}
