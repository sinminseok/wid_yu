import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/join/finish/popup/SharePopup.dart';
import 'package:wid_yu/young/account/login/view/YoungLoginView.dart';
import '../../../../common/utils/Color.dart';
import '../old-information/dto/OldLoginDto.dart';
import '../widgets/ProgressBar.dart';
import '../widgets/SignupAppBar.dart';

class JoinSuccessView extends StatefulWidget {
  String name;
  String phoneNumber;
  String id;

  List<OldLoginDto> olds;

  JoinSuccessView(this.name, this.phoneNumber, this.id, this.olds);

  @override
  State<JoinSuccessView> createState() => _JoinSuccessViewState();
}

class _JoinSuccessViewState extends State<JoinSuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: false,
        title: '',
        color: wWhiteBackGroundColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(3),
            _buildMainText(),
            _buildInfoCard(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.olds.map((old) => _buildInvitationCard(old)).toList(),
            ),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(left: 20.w, top: 32.h),
      child: Title2Text("환영해요, 보호자 님!", wGrey800Color),
    );
  }

  Widget _buildNextButton() {
    return InkWell(
      onTap: () {
        Get.offAll(() => YoungLoginView());
      },
      child: Container(
          margin: EdgeInsets.only(top: 32.h, bottom: 60.h),
          child: OrangeButton("서비스 시작하기!")),
    );
  }

  Widget _buildInfoCard() {
    return Center(
      child: Container(
        width: 335.w,
        height: 273.h,
        margin: EdgeInsets.only(top: 32.h, right: 20.w, left: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.17),
              spreadRadius: 5,
              blurRadius: 6,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            _buildInfoRow("이름", "${widget.name} 님"),
            _buildDivider(),
            _buildInfoRow("연락처", "${widget.phoneNumber}"),
            _buildDivider(),
            _buildInfoRow("아이디", "${widget.id}"),
            _buildDivider(),
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 110.w,
              height: 94.h,
              child: Image.asset("assets/common/user/youngManBox.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: 260.w,
      margin: EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubTitle2Text(label, wGrey600Color),
          Body1Text(value, wTextBlackColor),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 13.h, left: 14.w, right: 14.w),
      width: 308.w,
      height: 1.h,
      color: wGrey300Color,
    );
  }

  Widget _buildInvitationCard(OldLoginDto oldLoginDto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 21.w, top: 55.h),
          height: 60.h,
          child: Title2Text("아래 초대숫자로 부모님 계정에\n로그인해 주세요.", wGrey800Color),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
            width: 335.w,
            height: 110.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.17),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 22.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Title3Text("${oldLoginDto.name}", wPurpleColor),
                      Title3Text("님 로그인용 초대숫자", wGrey800Color),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Title2Text(
                              "${oldLoginDto.invitedCode}", wTextBlackColor),
                          Container(
                            margin: EdgeInsets.only(left: 8.w),
                            width: 18.w,
                            height: 18.h,
                            child: InkWell(
                                onTap: () {
                                  SharePopup()
                                      .showDialog(context, "12341234", "code");
                                },
                                child: Image.asset(
                                    "assets/images/icon/share-icon.png")),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
