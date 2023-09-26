import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:young/view/goal/GoalCreateView.dart';
import 'package:young/view/goal/widgets/today/OldMissionWidget.dart';
import 'package:young/view/goal/widgets/today/YoungMissionWidget.dart';

class GoalView extends StatefulWidget {
  const GoalView({Key? key}) : super(key: key);

  @override
  _GoalViewState createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView> {
  late bool today;
  bool _switchValue = false;

  @override
  void initState() {
    // TODO: implement initState
    today = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: extendButton(),
      appBar: AppBar(
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
                Container(
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                        Container(
                          child: Text(
                            "보호자님",
                            style: TextStyle(
                                color: kTextBlackColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "오늘은",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 17.sp),
                              ),
                            ),
                            Container(
                              child: Text(
                                " 75%",
                                style: TextStyle(
                                    color: kPurpleColor,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                "를 달성했어요.",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 17.sp),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30.w, top: 10.h),
                    width: 100.0.w, // Container의 너비
                    height: 100.0.h, // Container의 높이
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      // 원의 반지름
                      lineWidth: 5.0,
                      // 원의 두께
                      percent: 0.7,

                      center: Stack(
                        children: [
                          Container(
                            width: 63.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTextWhiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey, // 그림자 색상
                                  offset: Offset(0, 1), // 그림자 위치 (가로, 세로)
                                  blurRadius: 2.0, // 그림자 흐림 정도
                                  spreadRadius: 0.0, // 그림자 퍼짐 정도
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            height: 65.h,
                            child:
                                Image.asset("assets/images/user/youngMan.png"),
                          ),
                        ],
                      ),
                      progressColor: kOrangeColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                // On 상태 텍스트 색상 설정
                inactiveTextColor: kTextWhiteColor,
                // Off 상태 텍스트 색상 설정
                activeText: "전체",
                inactiveText: "오늘",
              ),
            ),
            YoungMissionWidget(),
            OldMissionWidget()

            // 화면 하단에 고정된 버튼
          ],
        ),
      ),
    );
  }

  FloatingActionButton extendButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: (GoalCreateView())));
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

      /// 텍스트 컬러
      foregroundColor: Colors.white,
      backgroundColor: kPurpleColor,
    );
  }
}
