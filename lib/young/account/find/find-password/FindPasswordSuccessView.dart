
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../common/utils/Color.dart';
import '../../login/YoungLoginView.dart';

class FindPasswordSuccessView extends StatelessWidget {
  const FindPasswordSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: wWhiteBackGroundColor,
        leading: Container(
          margin: EdgeInsets.only(
            top: 10.h,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined, // 사용할 아이콘
              color: Colors.black, // 아이콘 색상
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: (YoungLoginView())));
              // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
            },
          ),
        ),
      ),
      body: Column(
        children: [
          _buildMainText(),
          _buildFindInformation(),
          InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => YoungLoginView()),
                        (route) => false);
              },
              child: _buildButton()),
        ],
      ),
    );
  }

  Widget _buildMainText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Text(
              "비밀번호를 찾았어요!",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text(
            "해당 정보로 가입된 아이디가 있어요.",
            style: TextStyle(color: kTextBlackColor, fontSize: 15.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 80.h),
        width: 335.w,
        height: 44.h,
        decoration: BoxDecoration(
            color: wOrangeColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            "로그인 하러가기",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFindInformation() {
    return Container(
      width: 335.h,
      margin: EdgeInsets.only(top: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "이름",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "신민석",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "연락처",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "01012341234",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "아이디",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "sin1768",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "비밀번호",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "123456",
                    style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 240.w,
            height: 0.3,
            color: kTextGreyColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 110.w,
            height: 94.h,
            child: Image.asset("assets/common/user/youngManBox.png"),
          )
        ],
      ),
    );
  }

}
