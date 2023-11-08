import 'package:common/common-widget/mission/EmptyMissionGroupWidget.dart';
import 'package:common/utils/Color.dart';
import 'package:common/view/goal/goal-create/GoalCreateView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:common/common-widget/mission/MissionGroupWidget.dart';
import 'package:old/view/goal-register/GoalRegisterFinishView.dart';
import 'package:old/view/goal-register/GoalRegisterView.dart';
import 'package:old/view/goal/detail-view/GoalDetailView.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../mission/drug/DrugMissionView.dart';


class OldGoalView extends StatefulWidget {
  const OldGoalView({Key? key}) : super(key: key);

  @override
  _OldGoalView createState() => _OldGoalView();
}

class _OldGoalView extends State<OldGoalView> {
  bool today = true;
  bool _switchValue = false;
  bool _isBottomScroll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildExtendButton(),
      appBar: _buildAppBar(),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserInfo(),
            _buildSwitch(),
            _buildMissions(),
          ],
        ),
      ),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: wOrangeBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: GoalRegisterView(),
                ),
              );
            },
            child: Container(
              width: 47.w,
              height: 30.h,
              margin: EdgeInsets.only(top: 10.h, left: 10.w),
              child: Image.asset("assets/images/common/appbar_logo.png"),
            ),
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset("assets/images/icon/bell-icon.png"),
                  )),
              InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w, top: 10.h),
                    width: 30.w,
                    height: 30.h,
                    child: Image.asset(
                        "assets/images/icon/family-information-icon.png"),
                  )),
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
            child: GoalDetailView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25.w),
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
                          color: wPurpleColor,
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

  Widget _buildMissions() {
    return Container(
        margin: EdgeInsets.only(bottom: 60.h),
        child: EmptyMissionGroupWidget());
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 10.w, top: 17.h),
      width: 100.0.w,
      height: 100.0.h,
      child: CircularPercentIndicator(
        radius: 40.0,
        lineWidth: 5.0,
        percent: 0.7,
        center: _buildCircularProgressCenter(),
        progressColor: wOrangeColor,
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
        activeColor: wOrangeColor,
        inactiveColor: wPurple200Color,
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
      label: Container(
        child: Text(
          " 목표생성",
          style: TextStyle(fontSize: 16),
        ),
      ),
      icon: const Icon(
        Icons.add,
        size: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      backgroundColor: wPurpleColor,
    );
  }
}
