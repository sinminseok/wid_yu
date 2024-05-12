import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/find/find-id/view/FindIdView.dart';
import 'package:wid_yu/young/account/find/find-password/view/FindPasswordSuccessView.dart';
import 'package:wid_yu/young/account/find/find-password/controller/FindPasswordController.dart';
import 'package:wid_yu/young/account/find/find-password/widgets/FindInformation.dart';

import '../../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/FilePath.dart';
import '../../../join/phone-vertify/view/VertifyPhoneView.dart';
import '../widgets/InputPassword.dart';

class FindPasswordView extends StatefulWidget {
  const FindPasswordView({Key? key}) : super(key: key);

  @override
  _PasswordFindView createState() => _PasswordFindView();
}

class _PasswordFindView extends State<FindPasswordView> {
  FindPasswordController _controller = FindPasswordController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: wWhiteColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Obx(() => Column(
          children: [
            _controller.isSuccessFind == 0 ? _buildDuringFind() : Container(),
            _controller.isSuccessFind == -1 ? _buildFaliFind() : Container(),
          ],
        ))
      ),
    );
  }

  Widget _buildDuringFind() {
    return Container(
      height: 800.h,
      child: Column(
        children: [
          Column(
            children: [
              _buildFindText(),
              FindInformation(_controller),
              _controller.isSendNumber == true?VertifyNumberForm(_controller):Container()
            ],
          ),
          _controller.isVertify == true?_buildFindIdButton():Container()
        ],
      ),
    );
  }

  Widget _buildFindIdButton() {
    return Container(
        margin: EdgeInsets.only(top: 150.h),
        child: InkWell(
            onTap: () {
              _controller.clickFindPw();
            },
            child: OrangeButton("비밀번호 찾기")));
  }

  Widget _buildFaliFind() {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildFaliFindText(),
              FindInformation(_controller),
              VertifyNumberForm(_controller),
            ],
          ),
          _buildRetryButton(),

        ],
      ),
    );
  }

  Widget _buildRetryButton() {
    return Container(
      margin: EdgeInsets.only(top: 118.h),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: (VerificationPhoneView())));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: ButtonText("회원 가입하러 가기 ", wPurpleColor)
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios_outlined, color: wPurpleColor,size: 15.sp,),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FindPasswordSuccessView()),
                        (route) => false);
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: OrangeButton("다시찾기")))
        ],
      ),
    );
  }

  Widget _buildFaliFindText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 98.w,
          height: 104.h,
          child: Image.asset(commonImagePath + "icon/red_alarm_icon.png"),
        ),
        Center(
          child: Container(
            height: 33.h,
            margin: EdgeInsets.only(top: 10.h),
            child: Title2Text("등록된 정보와 일치하는 비밀번호가 없어요.", wGrey800Color)
          ),
        ),
        Container(
          height: 21.h,
          margin: EdgeInsets.only(top: 4.h),
          child: SubTitle2Text("혹시 정보를 잘못 입력하지는 않았나요?", wGrey600Color)
        )
      ],
    );
  }

  Widget _buildFindText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30.h,
          margin: EdgeInsets.only(top: 28.h),
          child: Title2Text("비밀번호 찾기", wGrey800Color)
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          height: 21.h,
          child: Body2Text("비밀번호를 찾기 위한 정보를 입력해 주세요.", wGrey600Color)
        )
      ],
    );
  }




}
