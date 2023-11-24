import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/old/goal/detail-view/OldMessageView.dart';

import '../../common/common-widget/mission/MissionGroupWidget.dart';
import '../../common/utils/Color.dart';
import '../../common/view/goal/goal-create/GoalCreateView.dart';
import '../../common/view/popup/AlarmOnPopup.dart';
import '../goal-register/GoalRegisterView.dart';
import 'detail-view/OldGoalDetailView.dart';


class OldGoalView extends StatefulWidget {
  const OldGoalView({Key? key}) : super(key: key);

  @override
  _OldGoalView createState() => _OldGoalView();
}

class _OldGoalView extends State<OldGoalView> {
  bool today = true;
  bool _switchValue = false;

  //List<Mission> missions = [Mission("미션1", _subtitle, _type)];

  @override
  void initState() {
    checkAlarm();
    super.initState();
  }

  void checkAlarm()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.get("alarmOn");
    if(key == null){
      AlarmOnPopup().showDialog(context);
    }
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

              // Navigator.push(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.fade,
              //     child: GoalRegisterView(),
              //   ),
              // );
            },
            child: Container(
              width: 47.w,
              height: 30.h,
              margin: EdgeInsets.only(top: 10.h, left: 10.w),
              child: Image.asset("assets/common/common/appbar_logo.png"),
            ),
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: OldMessageView(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset("assets/common/icon/bell-icon.png"),
                  )),
              InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w, top: 10.h),
                    width: 30.w,
                    height: 30.h,
                    child: Image.asset(
                        "assets/common/icon/family-information-icon.png"),
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
            child: OldGoalDetailView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30.w),
              width: 210.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "부모님 님",
                    style: TextStyle(
                      color: kTextBlackColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
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
        //미션이 없을때 EmptyMissionGroupWidget()
        // 미션이 있을때 MissionGroupWidget()
        child: MissionGroupWidget(true));
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 20.w, top: 17.h),
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
            color: wWhiteColor,
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
          child: Image.asset("assets/common/user/youngMan.png"),
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
        activeTextColor: wWhiteColor,
        inactiveTextColor: wWhiteColor,
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
            child: GoalCreateView(true),
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
