
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import 'add-young/AddYoungView.dart';
import 'add-old/view/AddOldView.dart';

class AddFamilyView extends StatefulWidget {
  const AddFamilyView({Key? key}) : super(key: key);

  @override
  _AddFamilyViewState createState() => _AddFamilyViewState();
}

class _AddFamilyViewState extends State<AddFamilyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '추가하기', color: wPurpleBackGroundColor,),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10.h, right: 14.w, left: 14.w),
          width: 347.w,
          height: 591.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: wWhiteColor,
            border: Border.all(color: wGrey100Color)
          ),
          child: Column(
            children: [
              _buildMainText(),
              _buildYoungButton(),
              _buildOldButton(),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildMainText(){
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 36.h),
            width: 53.w,
            height: 53.h,
            child: Image.asset(commonImagePath + "icon/add_persion_icon.png"),
          ),
        ),
        Container(
          height: 36.h,
          margin: EdgeInsets.only(top: 14.h),
          child: Title1Text("가족 구성원 추가하기", wGrey800Color),
        ),
        Container(
          height: 27.h,
          margin: EdgeInsets.only(top: 4.h),
          child: Title3Text("추가할 가족구성원을 먼저 선택해 보세요.", wGrey700Color),
        )
      ],
    );
  }

  Widget _buildOldButton(){
    return Container(margin: EdgeInsets.only(top: 15.h,left: 18.w,right: 18.w
    ),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: AddOldView(),
              ),
            );
          },
          child: Container(
            width: 311.w,
            height: 168.h,
            decoration: BoxDecoration(
                border: Border.all(color: wGrey200Color),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: wGrey100Color
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.w,
                        height: 36.h,
                        child: Center(
                          child: Title1Text("부모님 추가", wTextBlackColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:  4.h,left: 5.w),
                        child: Body2Text("부모님으로 로그인해요.", wGrey700Color),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:  3.h,left: 5.w),
                        child: Body2Text("회원가입은 보호자님이 해주세요.", wGrey700Color),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 82.w,
                  height: 94.h,
                  margin: EdgeInsets.only(left:0.w),
                  child: Image.asset(commonImagePath + "user/oldManBox.png"),
                )
              ],
            ),

          )
      ),
    );
  }

  //commonImagePath + "user/youngManBox.png
  Widget _buildYoungButton(){
    return Container(margin: EdgeInsets.only(top: 50.h,left: 18.w, right: 18.w),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: AddYoungView(),
              ),
            );
          },
          child: Container(
            width: 311.w,
            height: 168.h,
            decoration: BoxDecoration(
              border: Border.all(color: wGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: wGrey100Color
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.w,
                        height: 36.h,
                        child: Center(
                          child: Title1Text("보호자 추가", wTextBlackColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:  4.h,left: 5.w),
                        child: Body2Text("보호자로 회원가입, 로그인하여", wGrey700Color),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:  3.h,left: 5.w),
                        child: Body2Text("부모님의 정보를 관리해요.", wGrey700Color),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 98.w,
                  height: 94.h,
                  margin: EdgeInsets.only(left: 0.w),
                  child: Image.asset(commonImagePath + "user/youngManBox.png"),
                )
              ],
            ),

          )
      ),
    );
  }

}
