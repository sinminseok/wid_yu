import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/common-widget/mission-detail/CommonMissionWidget.dart';
import '../../../common/common-widget/mission-detail/DrugMissionWidget.dart';
import '../../../common/common-widget/mission-detail/WalkMissionWidget.dart';
import '../../../common/model/mission/Mission.dart';
import '../../../common/model/mission/MissionType.dart';
import '../../../common/text/CustomText.dart';
import '../../../common/utils/Color.dart';

class OldGoalDetailView extends StatefulWidget {
  const OldGoalDetailView({Key? key}) : super(key: key);

  @override
  _GoalDetailView createState() => _GoalDetailView();
}

class _GoalDetailView extends State<OldGoalDetailView> {
  final List<Mission> items = [
    Mission("위염약", "~~복용하세요", MissionType.DRUG),
    Mission("런닝", "~~복용하세요", MissionType.WALK),
    Mission("독서", "~~복용하세요", MissionType.COMMON),
  ];
  final List<String> days = ["일", "월", "화", "수", "목", "금", "토"];

  bool isOpenCalendar = true;

  @override
  void dispose() {
    // TODO: implement dispose
    isOpenCalendar = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoalInfo(),
            _buildMissionDate(),
            _buildTodayMission(),
            _buildMonthSuccess(),
            isOpenCalendar ? _buildCallendar() : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildTodayMission() {
    return Column(
      children: [
        DrugMissionWidget(items[1]),
        WalkMissionWidget(items[2]),
        CommonMissionWidget(items[2]),
      ],
    );
  }

  Widget _buildMonthSuccess() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 20.w,right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 0.w, top: 35.h),
            child: SubTitle2Text(
                "이번달 달성률",
                wGrey700Color
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 335.w,
              height: 87.h,
              decoration: BoxDecoration(
                  border: Border.all(color: wGrey100Color),
                  color: wWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15.h, left: 20.w),
                    child: Column(
                      children: [
                        Container(
                          height: 24.h,
                          child: Body1Text(
                              "80%",
                              wGrey500Color
                          ),
                        ),
                        Container(
                          height: 21.h,
                          margin: EdgeInsets.only(top: 6.h),
                          child: Body2Text(
                              "저번달 평균",
                              wGrey500Color
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13.h, right: 35.w),
                    child: Column(
                      children: [
                        Container(
                          height: 30.h,
                          child: PercentageText(
                              "13%",
                              wPurpleColor
                          ),
                        ),
                        Container(
                          height: 21.h,
                          margin: EdgeInsets.only(top: 3.h),
                          child: SubTitle2Text(
                              "이번달 평균",
                              wGrey600Color
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isOpenCalendar = !isOpenCalendar;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.w),
                      child: Icon(
                        isOpenCalendar
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: wGrey500Color,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallendar() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int totalDaysInMonth = DateTime(year, month + 1, 0).day;

    return Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        width: 335.w,
        decoration: BoxDecoration(
            border: Border.all(color: wGrey100Color, width: 1.w),
            color: wWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 17.h),
              child: SubTitle2Text(
                  "${month}월",
                  kTextBlackColor
              ),
            ),
            // 요일 출력
            Container(
              margin: EdgeInsets.only(top: 15.h,right: 20.w, left: 20.w),
              width: 305.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days.asMap().entries.map((entry) {
                  final day = entry.value;
                  return Container(
                    child: Body2Text(
                        day,
                        wGrey600Color
                    ),
                  );
                }).toList(),
              ),
            ),

            Container(
              width: 340.w,
              height: 420.h,
              margin: EdgeInsets.only(top: 10.h),
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 7, // 7 columns for 7 days in a week
                ),
                itemCount: totalDaysInMonth,
                itemBuilder: (BuildContext context, int index) {
                  DateTime currentDate = DateTime(year, month, index + 1);
                  bool isToday = currentDate.day == now.day &&
                      currentDate.month == now.month;
                  return Container(
                    child: Column(
                      children: [
                        SubTitle2Text(
                            "${index + 1}", // Display day of the month
                            wTextBlackColor
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: CircularPercentIndicator(
                              radius: 14.0.sp,
                              lineWidth: 5.5.sp,
                              backgroundColor: wGrey100Color,
                              circularStrokeCap: CircularStrokeCap.round,
                              percent: 0.7, // Set your percentage here

                              progressColor:wOrangeColor
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }


  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: wOrangeBackGroundColor,
      automaticallyImplyLeading: false,
      title: Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Image.asset("assets/images/icon/back-icon.png",   width: 11.w,
                    height: 19.h,fit: BoxFit.contain,)
              ),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 10.h, right: 0.w),
                    child: Title3Text(
                        "부모님 님",
                        wGrey800Color
                    ))),
            Container()
          ],
        ),
      ),

    );
  }

  Widget _buildGoalInfo() {
    return Container(
      margin: EdgeInsets.only(top: 38.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            width: 190.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w, bottom: 3.h),
                  child: Title1Text(
                    "오늘은",
                      kTextBlackColor
                  ),
                ),
                Row(
                  children: [
                    Container(
                        height: 33.h,
                        decoration: BoxDecoration(
                            color: wOrangeColor,
                            border: Border.all(color: wOrange200Color),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(top: 3.h),
                        child: Container(
                          height: 33.h,
                          margin: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Center(
                            child: PercentageText(
                              "40P",
                                wWhiteColor
                            ),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 6.w),
                      child: Title1Text(
                        "벌었어요.",
                          kTextBlackColor
                      ),
                    )
                  ],
                ),
                Container(
                  height: 27.h,
                  margin: EdgeInsets.only(left: 5.w, top: 5.h),
                  child: Title3Text(
                    "조금만 더 힘내요!",
                      wGrey500Color
                  ),
                )
              ],
            ),
          ),
          _buildCircularProgress(),
        ],
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 20.w, top: 0.h),
      width: 130.0.w,
      height: 130.0.h,

      child: CircularPercentIndicator(
        backgroundColor: wGrey200Color,
        circularStrokeCap: CircularStrokeCap.round,
        radius: 63.0,
        lineWidth: 10.0,
        percent: 0.7,
        center: _buildCircularProgressCenter(),
        progressColor: wOrangeColor,
      ),
    );
  }

  Widget _buildCircularProgressCenter() {
    return Container(
        height: 93.h,
        width: 93.w,
        decoration:
            BoxDecoration(
                border: Border.all(color: wGrey100Color),
                color: wWhiteColor, shape: BoxShape.circle),
        child: Image.asset("assets/common/goal/goal.png"));
  }

  Widget _buildMissionDate() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 48.h, bottom: 10.h),
      width: 140.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("2023.09.23",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp)),
          Text("수요일",
              style: TextStyle(color: kTextBlackColor, fontSize: 15.sp)),
        ],
      ),
    );
  }
}
