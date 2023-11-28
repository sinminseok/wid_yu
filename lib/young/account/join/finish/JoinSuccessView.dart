import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/widgets/RoundedButton.dart';
import 'JoinFinishView.dart';
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
      appBar: SignUpAppBar(canBack: false),
      body: SingleChildScrollView(
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

  Widget _buildMainText(){
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 27.h),
      child: Text(
        "환영해요, 보호자 님!",
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: kTextBlackColor,
        ),
      ),
    );
  }

  Widget _buildNextButton(){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: JoinFinishView(),
          ),
        );
      },
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 20.h),
            child: RoundedButtonWidget(title: "시작하기")),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Center(
      child: Container(
        width: 335.w,
        height: 270.h,
        margin: EdgeInsets.only(top: 28.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            _buildInfoRow(label, value),
            _buildDivider(),
            _buildInfoRow("연락처", "010 1234 1234"),
            _buildDivider(),
            _buildInfoRow("아이디", "sin1768@naver.com"),
            _buildDivider(),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              width: 110.w,
              height: 95.h,
              child: Image.asset("assets/common/user/youngManBox.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: 290.w,
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: wGrey600Color, fontSize: 14.sp, fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(color: kTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 308.w,
      height: 1.h,
      color: wGrey300Color,
    );
  }

  Widget _buildInvitationCard() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        width: 335.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("부모님1", style: TextStyle(color: wPurpleColor, fontSize: 18.sp)),
                  Text("님 로그인용 초대숫자", style: TextStyle(color: kTextBlackColor, fontSize: 18.sp)),
                ],
              ),
            ),
            Text(
              "1234567",
              style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
