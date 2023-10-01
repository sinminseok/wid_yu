import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:young/view/goal/GoalCreateView.dart';
import 'package:young/view/goal/detailView/YoungGoalDetailView.dart';
import 'package:young/view/goal/widgets/OldMissionWidget.dart';
import 'package:young/view/goal/widgets/YoungMissionWidget.dart';

class GoalView extends StatefulWidget {
  const GoalView({Key? key}) : super(key: key);

  @override
  _GoalViewState createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView> {
  bool today = true;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildExtendButton(),
      appBar: _buildAppBar(),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserInfo(),
            _buildSwitch(),
            YoungMissionWidget(),
            OldMissionWidget(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 47.w,
            height: 30.h,
            child: Image.asset("assets/images/common/appbar_logo.png"),
          ),
          Row(
            children: [
              Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: YoungGoalDetailView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30.w),
              width: 190.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "보호자님",
                    style: TextStyle(
                      color: kTextBlackColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "오늘은",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        " 75%",
                        style: TextStyle(
                          color: kPurpleColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "를 달성했어요.",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildCircularProgress(),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 30.w, top: 10.h),
      width: 100.0.w,
      height: 100.0.h,
      child: CircularPercentIndicator(
        radius: 40.0,
        lineWidth: 5.0,
        percent: 0.7,
        center: _buildCircularProgressCenter(),
        progressColor: kOrangeColor,
      ),
    );
  }

  Widget _buildCircularProgressCenter() {
    return Stack(
      children: [
        Container(
          width: 63.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kTextWhiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
                blurRadius: 2.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 65.h,
          child: Image.asset("assets/images/user/youngMan.png"),
        ),
      ],
    );
  }

  Widget _buildSwitch() {
    return Container(
      margin: EdgeInsets.only(right: 250.w, bottom: 20.h),
      child: FlutterSwitch(
        width: 60.0.w,
        height: 29.0.h,
        showOnOff: true,
        valueFontSize: 13.sp,
        toggleSize: 20.0,
        value: _switchValue,
        onToggle: (value) {
          setState(() {
            _switchValue = value;
          });
        },
        activeColor: kOrangeColor,
        inactiveColor: kPurpleColor,
        toggleColor: Colors.white,
        activeTextColor: kTextWhiteColor,
        inactiveTextColor: kTextWhiteColor,
        activeText: "전체",
        inactiveText: "오늘",
      ),
    );
  }

  FloatingActionButton _buildExtendButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: GoalCreateView(),
          ),
        );
      },
      label: const Text(
        " 목표생성",
        style: TextStyle(fontSize: 16),
      ),
      icon: const Icon(
        Icons.add,
        size: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      backgroundColor: kPurpleColor,
    );
  }
}
