import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/find/find-id/dto/FindIdResponse.dart';
import 'package:wid_yu/young/account/find/find-password/view/FindPasswordSuccessView.dart';
import 'package:wid_yu/young/account/find/find-password/view/FindPasswordView.dart';

import '../../../../../common/utils/Color.dart';
import '../../../login/view/YoungLoginView.dart';

class FindIdSuccessView extends StatelessWidget {
  FindIdResponseDto findIdResponseDto;


  FindIdSuccessView(this.findIdResponseDto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(canBack: false, title: "",color: wWhiteColor,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildMainText(),
              _buildFindInformation(),
            ],
          ),
          Column(
            children: [
              _buildGoFindPassword(),
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
          )


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
            height: 30.h,
            margin: EdgeInsets.only(top: 28.h),
            child: Title2Text("아이디를 찾았어요!", wGrey800Color)
          ),
        ),
        Container(
          height: 21.h,
          margin: EdgeInsets.only(top: 10.h),
          child: Body2Text("해당 정보로 가입된 아이디가 있어요.", wGrey600Color)
        ),
      ],
    );
  }

  Widget _buildFindInformation() {
    return Container(
      width: 335.h,
      height: 257.h,
      margin: EdgeInsets.only(top: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 12,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SubTitle2Text("이름", wGrey600Color)
                ),
                Container(
                  child: Body1Text("${findIdResponseDto.name} 님", wTextBlackColor)
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w,top: 13.h),
            width: 308.w,
            height: 0.3,
            color: wGrey300Color,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: SubTitle2Text("연락처", wGrey600Color)
                ),
                Container(
                    child: Body1Text("${findIdResponseDto.phoneNumber} 님", wTextBlackColor)
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w,top: 13.h),
            width: 308.w,

            height: 0.3,
            color: wGrey300Color,
          ),
          Container(
            width: 230.w,
            margin: EdgeInsets.only(top: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: SubTitle2Text("아이디", wGrey600Color)
                ),
                Container(
                    child: Title2Text("${findIdResponseDto.id}", wTextBlackColor)
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 0.h),
            width: 110.w,
            height: 94.h,
            child: Image.asset("assets/common/user/youngManBox.png"),
          )
        ],
      ),
    );
  }

  Widget _buildGoFindPassword() {
    return Container(
      margin: EdgeInsets.only(top: 0.h),
      child: InkWell(
          onTap: () {
            Get.to(() => FindPasswordView());
          },
          child: Container(
            height: 24.h,
            margin: EdgeInsets.only(bottom: 20.h),
            child: ButtonText("비밀번호 찾기", wGrey600Color)
          )),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 60.h),
      child: OrangeButton("로그인하러 가기")
    );
  }
}
