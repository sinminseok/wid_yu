import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/young/goal/widgets/OldMissionWidget.dart';
import '../../common/common-widget/mission/MissionGroupWidget.dart';
import '../../common/utils/Color.dart';
import '../../common/view/goal/goal-create/GoalCreateView.dart';
import '../../common/view/popup/AlarmOnPopup.dart';
import '../family-manager/FamilyManagerView.dart';
import 'detail-view/ChangeOrderView.dart';
import 'detail-view/YoungGoalDetailView.dart';
import 'detail-view/YoungMessageView.dart';

class YoungGoalView extends StatefulWidget {
  const YoungGoalView({Key? key}) : super(key: key);

  @override
  _YoungGoalViewState createState() => _YoungGoalViewState();
}

class _YoungGoalViewState extends State<YoungGoalView> {
  bool today = true;
  bool _switchValue = false;
  bool _isBottomScroll = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    checkAlarm();
    controllScroll();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void checkAlarm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.get("alarmOn");
    if (key == null) {
      AlarmOnPopup().showDialog(context);
    }
  }

  void controllScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 스크롤이 끝까지 내려갔을 때
        setState(() {
          _isBottomScroll = true;
        });
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        // 스크롤이 끝까지 올라갔을 때
        setState(() {
          _isBottomScroll = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
              child: _buildExtendButton()),
          _isBottomScroll == false
              ? Container(child: _buildFloatingOldInformation())
              : Container()
        ],
      ),
      appBar: _buildAppBar(),
      backgroundColor: wPurpleBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            _buildUserInfo(),
            _buildSwitch(),
            _buildYoungMissions(),
            _isBottomScroll ? OldMissionWidget() : Container(),
            _buildChangeOrderButton()
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingOldInformation() {
    return InkWell(
      onTap: () {
        double desiredPosition =
            _scrollController.position.maxScrollExtent + 400.h;
        setState(() {
          _isBottomScroll = true;
          _scrollController.animateTo(
            desiredPosition,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Container(
        width: 360.w,
        height: 120.h,
        margin: EdgeInsets.only(top: 20.h, bottom: 0.h),
        decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w, top: 0.h, bottom: 10.h),
                  width: 70.0.w, // Container의 너비
                  height: 85.0.h, // Container의 높이
                  child: Container(
                    margin: EdgeInsets.only(left: 5.w, top: 5.h),
                    child: CircularPercentIndicator(
                      radius: 34.0,
                      // 부모 컨테이너의 크기에 맞게 조절
                      lineWidth: 5.0,
                      percent: 0.7,
                      center: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: wGrey200Color,
                          shape: BoxShape.circle
                        ),
                        child: Image.asset("assets/common/user/oldMan.png"),
                      ),
                      progressColor: wOrangeColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "부모님2님",
                          style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "오늘은 ",
                              style: TextStyle(
                                  color: kTextBlackColor, fontSize: 16.sp),
                            ),
                          ),
                          Container(
                            child: Text(
                              "40%",
                              style: TextStyle(
                                  color: wPurpleColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp),
                            ),
                          ),
                          Container(
                            child: Text(
                              " 를 달성했어요.",
                              style: TextStyle(
                                  color: kTextBlackColor, fontSize: 16.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 45.h, right: 18.w),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: wPurpleBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 47.w,
            height: 30.h,
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            child: Image.asset("assets/common/common/appbar_logo.png"),
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: (YoungMessageView())));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset("assets/common/icon/bell-icon.png"),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: (FamilyManagerView())));
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
            child: YoungGoalDetailView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 15.h),
              width: 210.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "보호자님",
                    style: TextStyle(
                      color: kTextBlackColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Row(
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
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Text(
                      "조금만 더 하면 목표 달성!",
                      style: TextStyle(
                          color: wGrey500Color,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
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
      margin: EdgeInsets.only(right: 20.w, top: 17.h),
      width: 100.0.w,
      height: 100.0.h,
      child: CircularPercentIndicator(
        radius: 40.0,
        lineWidth: 5.0,
        percent: 0.7,
        center: Container(
          margin: EdgeInsets.only(top: 0.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: wWhiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                offset: Offset(0.0, 0.3),
              ),
            ],
          ),
          height: 65.h,
          child: Image.asset("assets/common/user/youngMan.png"),
        ),
        progressColor: wOrangeColor,
      ),
    );
  }

  Widget _buildSwitch() {
    return Container(
      margin: EdgeInsets.only(right: 250.w, bottom: 10.h, top: 20.h),
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
            child: GoalCreateView(false),
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

  Widget _buildYoungMissions() {
    //사용자의 미션이 없을 경우 EmptyMissionGroupWidget
    //사용자의 미션이 있을 경우 MissionGroupWidget
    return MissionGroupWidget(false);
  }

  Widget _buildChangeOrderButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      width: 140.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: (ChangeOrderView())));
        },
        child: Center(
          child: Text(
            "가족 목록 순서 변경",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextBlackColor,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
