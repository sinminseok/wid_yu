import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/login/view/YoungLoginView.dart';
import '../../../../common/utils/Color.dart';
import '../widgets/ProgressBar.dart';
import '../widgets/SignupAppBar.dart';

class JoinSuccessOnlyYoungView extends StatelessWidget {
  String name;
  String phoneNumber;
  String id;


  JoinSuccessOnlyYoungView(this.name, this.phoneNumber, this.id);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: wWhiteColor,
        appBar: SignUpAppBar(canBack: false),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressBar(),
              _buildMainText(),
              _buildInfoCard(),
              Container(
                height: 95.h,
              ),
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check,size: 11.sp,color: wWhiteColor,),
                  ),
                ),

                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wOrange200Color
                ),

                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wGrey300Color),
                    color: wGrey300Color,
                    shape: BoxShape.circle,
                  ),

                ),
                Container(
                    width: 90.w,
                    height: 1.h,
                    color: wOrange200Color
                ),

                Container(
                  width: 23.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wOrange200Color),
                    color: wOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check,size: 11.sp,color: wWhiteColor,),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 290.w,
            margin: EdgeInsets.only(right: 45.w, top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.w),
                    child: Helper2Text("보호자 정보", wOrange200Color)
                ),
                Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: Helper2Text("부모님 정보", wGrey300Color)
                ),
                Container(
                    child: Helper2Text("완료", wOrange200Color)
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMainText() {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(left: 20.w, top: 28.h),
      child: Title2Text("환영해요, 보호자 님!", wGrey800Color),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 155.h, bottom: 60.h),
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
              child: OrangeButton("서비스 시작하기!")),
    );
  }

  Widget _buildInfoCard() {
    return Center(
      child: Container(
        width: 335.w,
        height: 273.h,
        margin: EdgeInsets.only(top: 28.h, right: 20.w, left: 20.w),
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
            _buildInfoRow("이름", "$name 님"),
            _buildDivider(),
            _buildInfoRow("연락처", "$phoneNumber"),
            _buildDivider(),
            _buildInfoRow("아이디", "$id"),
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
          margin: EdgeInsets.only(left: 21.w, top: 60.h),
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
