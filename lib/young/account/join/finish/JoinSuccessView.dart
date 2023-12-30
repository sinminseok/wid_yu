import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/login/view/YoungLoginView.dart';
import '../../../../common/utils/Color.dart';
import '../widgets/ProgressBar.dart';
import '../widgets/SignupAppBar.dart';

class JoinSuccessView extends StatefulWidget {
  const JoinSuccessView({Key? key}) : super(key: key);

  @override
  State<JoinSuccessView> createState() => _JoinSuccessViewState();
}

class _JoinSuccessViewState extends State<JoinSuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: SignUpAppBar(canBack: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(3),
            _buildMainText(),
            _buildInfoCard("아이디", "sin1768@naver.com"),
            _buildInvitationCard(),
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
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: YoungLoginView(),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(top: 32.h, bottom: 60.h),
          child: OrangeButton("서비스 시작하기!")),
    );
  }

  Widget _buildInfoCard(String label, String value) {
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
            _buildInfoRow("이름", "보호자 님"),
            _buildDivider(),
            _buildInfoRow("연락처", "010 1234 1234"),
            _buildDivider(),
            _buildInfoRow("아이디", "sin1768"),
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

  Widget _buildInvitationCard() {
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
                      Title3Text("부모님1", wPurpleColor),
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
                          Title2Text("1234567", wTextBlackColor),
                          Container(
                            margin: EdgeInsets.only(left: 8.w),
                            width: 18.w,
                            height: 18.h,
                            child: InkWell(
                                onTap: () {},
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
