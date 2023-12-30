import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../old/account/view/OldLoginView.dart';
import '../../../young/account/login/view/YoungLoginView.dart';
import '../../utils/Color.dart';
import '../../utils/FilePath.dart';

class SelectUserView extends StatefulWidget {
  @override
  State<SelectUserView> createState() => _SelectUserViewState();
}

class _SelectUserViewState extends State<SelectUserView> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
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
      ),
    );
  }

  Widget _buildOldButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: InkWell(
        onTap: () {
          Get.to(() => OldLoginView(), transition: Transition.fade);

        },
        child: Container(
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
                              child: Image.asset("assets/images/common/account/old-man.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.h, left: 38.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Title1Text("부모님", wTextBlackColor),
                            Container(
                                margin: EdgeInsets.only(top: 12.h),
                                child: Body2Text("부모님으로 로그인해요.\n회원가입은 보호자님이 해주세요.", wGrey700Color))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildYoungButton() {
    return Container(
      margin: EdgeInsets.only(top: 56.h),
      child: InkWell(
          onTap: () {
            Get.to(() => YoungLoginView(), transition: Transition.fade);

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
                            child: Image.asset("assets/images/common/account/young-man.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 38.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title1Text("보호자", wTextBlackColor),
                    Container(
                        margin: EdgeInsets.only(top: 12.h),
                        child: Body2Text("보호자로 회원가입, 로그인하여 \n부모님의 정보를 관리해요. ", wGrey700Color))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 93.h),
        width: 92.w,
        height: 69.h,
        child: Image.asset("assets/images/common/account/wid-yu-logo.png"),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      width: 175.w,
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Container(
            child: Body2Text("건강한 습관과 소통의 형성", wGrey800Color)
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
              child: Body2Text("가족과, 그리고 위듀와 함께해요.", wGrey800Color)
          ),
        ],
      ),
    );
  }
}
