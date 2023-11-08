import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old/view/account/login/OldLoginView.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/login/YoungLoginView.dart';
import '../../../utils/Color.dart';

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
        child: _buildUserType(
          "부모님",
          "부모님으로 로그인해요.\n회원가입은 보호자님이 해주세요.",
          "assets/images/user/oldManBox.png",
        ),
      ),
    );
  }

  Widget _buildYoungButton(){
    return Container(margin: EdgeInsets.only(top: 60.h),
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
        child: _buildUserType(
          "보호자",
          "보호자로 회원가입.\n로그인하여 부모님의 정보를 관리해요",
          "assets/images/user/youngManBox.png",
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 116.h),
        width: 110.w,
        height: 35.h,
        child: Image.asset("assets/images/common/appbar_logo.png"),
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

  Widget _buildUserType(String title, String description, String imagePath) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 339.w,
            height: 168.h,
            decoration: BoxDecoration(
              border: Border.all(color: wBorderGreyColor, width: 0.4.w),
              color: wContainerGrey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
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
                      child: Image.asset(imagePath),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: wTextBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                description,
                style: TextStyle(fontSize: 14.sp, color: kTextBlackColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
