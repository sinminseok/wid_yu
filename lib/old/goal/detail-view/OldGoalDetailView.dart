import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/common-widget/mission-detail/CommonMissionWidget.dart';
import '../../../common/common-widget/mission-detail/DrugMissionWidget.dart';
import '../../../common/common-widget/mission-detail/WalkMissionWidget.dart';
import '../../../common/model/mission/Mission.dart';
import '../../../common/model/mission/MissionType.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoalInfo(),
            _buildMissionDate(),
            _buildTodayMission(),
            _buildMonthSuccess(),
            _buildCallendar()
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 35.h),
          child: Text("이번달 달성률", style: TextStyle(color: wGrey600Color,fontSize: 16.sp, fontWeight: FontWeight.bold),),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 335.w,
            height: 87.h,
            decoration: BoxDecoration(
              border: Border.all(color: wGrey100Color),
                color: kTextWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.h,left: 25.w),
                  child: Column(
                    children: [
                      Container(
                        child: Text("80%",style: TextStyle(color: wGrey500Color, fontSize: 16.sp),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.h),
                        child: Text("저번달 평균",style: TextStyle(color: wGrey500Color, fontSize: 14.sp),),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 13.h,right: 25.w),
                  child: Column(
                    children: [
                      Container(
                        child: Text("13%", style: TextStyle(color: wPurpleColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                      ),
                      Container(

                        child: Text("이번달 평균", style: TextStyle(color: wGrey600Color,fontSize: 16.sp,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Icon(Icons.keyboard_arrow_up, color: wGrey500Color,),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCallendar() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int totalDaysInMonth = DateTime(year, month + 1, 0).day;

    return Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w,top: 15.h),
        width: 360.w,
        height: 400.h,
        decoration: BoxDecoration(
            border: Border.all(color: wGrey100Color),
            color: kTextWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: Text(
                "${month}월",
                style: TextStyle(
                    color: kTextBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 305.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days.asMap().entries.map((entry) {
                  final day = entry.value;
                  return Container(
                    child: Text(
                      day,
                      style: TextStyle(color: kTextBlackColor),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: 340.w,
              height: 300.h,
              margin: EdgeInsets.only(top: 10.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // 7 columns for 7 days in a week
                ),
                itemCount: totalDaysInMonth,
                itemBuilder: (BuildContext context, int index) {
                  DateTime currentDate = DateTime(year, month, index + 1);
                  bool isToday = currentDate.day == now.day &&
                      currentDate.month == now.month;
                  return Container(
                    width: 45.w,
                    child: Column(
                      children: [
                        Text(
                          "${index + 1}", // Display day of the month
                          style: TextStyle(
                            color: isToday ? wOrangeColor : kTextBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: CircularPercentIndicator(
                            radius: 15.0,
                            lineWidth: 4.0,
                            percent: 0.7, // Set your percentage here

                            progressColor:
                                isToday ? wOrangeColor : wPurpleColor,
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black87,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Center(
        child: Container(
          margin: EdgeInsets.only(right: 45.w),
          child: Text(
            "부모님",
            style: TextStyle(
              color: kTextBlackColor,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalInfo() {
    return Container(
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
                  margin: EdgeInsets.only(left: 5.w, bottom: 3.h),
                  child: Text(
                    "오늘은",
                    style: TextStyle(
                      color: kTextBlackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        width: 75.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: wOrangeColor,
                            border: Border.all(color: wOrange200Color),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(top: 3.h),
                        child: Center(
                          child: Text(
                            "100P",
                            style: TextStyle(
                                color: kTextWhiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 6.w),
                      child: Text(
                        "벌었어요.",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w, top: 5.h),
                  child: Text(
                    "조금만 더 힘내요!",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: wGrey500Color),
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
      margin: EdgeInsets.only(right: 30.w, top: 10.h),
      width: 100.0.w,
      height: 100.0.h,
      child: CircularPercentIndicator(
        radius: 45.0,
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
          width: 70.h,
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
          margin: EdgeInsets.only(top: 9.h, left: 2.w),
          height: 70.h,
          child: Image.asset("assets/common/goal/goal.png"),
        ),
      ],
    );
  }

  Widget _buildMissionDate() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
      width: 120.w,
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
