import 'package:common/model/mission/Mission.dart';
import 'package:common/model/mission/MissionType.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:young/view/goal/widgets/detail/YoungCommonWidget.dart';
import 'package:young/view/goal/widgets/detail/YoungDrugWidget.dart';
import 'package:young/view/goal/widgets/detail/YoungWalkWidget.dart';
import 'package:intl/intl.dart';


class YoungGoalDetailView extends StatefulWidget {
  const YoungGoalDetailView({Key? key}) : super(key: key);

  @override
  _YoungGoalDetailViewState createState() => _YoungGoalDetailViewState();
}

class _YoungGoalDetailViewState extends State<YoungGoalDetailView> {
  final List<Mission> items = [
    Mission("위염약", "~~복용하세요", MissionType.DRUG),
    Mission("런닝", "~~복용하세요", MissionType.WALK),
    Mission("독서", "~~복용하세요", MissionType.COMMON),
  ];
  final List<String> days = ["일","월","화","수","목","금","토"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoalInfo(),
            _buildMissionDate(),
            YoungDrugWidget(items[1]),
            YoungWalkWidget(items[2]),
            YoungCommonWidget(items[2]),
            _buildCallendar()
          ],
        ),
      ),
    );
  }

  Widget _buildCallendar() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int totalDaysInMonth = DateTime(year, month + 1, 0).day;

    return Container(
      margin: EdgeInsets.only(left: 10.w,right: 10.w),
      width: 360.w,
      height: 400.h,
      decoration: BoxDecoration(
        border: Border.all(color: kTextGreyColor, width: 0.1.w),
        color: kTextWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child:Text("${month}월",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 16.sp),),),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 305.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: days.asMap().entries.map((entry) {
                final index = entry.key;
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
                bool isToday = currentDate.day == now.day && currentDate.month == now.month;
                return Container(
                  width: 45.w,
                  child: Column(
                    children: [
                      Text(
                        "${index + 1}", // Display day of the month
                        style: TextStyle(
                          color: isToday ? kOrangeColor : kTextBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        child: CircularPercentIndicator(
                          radius: 15.0,
                          lineWidth: 4.0,
                          percent: 0.7, // Set your percentage here

                          progressColor: isToday ? kOrangeColor : kPurpleColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }



  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
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
            "보호자",
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
                Text(
                  "오늘은",
                  style: TextStyle(
                    color: kTextBlackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "75% ",
                        style: TextStyle(
                          color: kPurpleColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "달성했습니다.",
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
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
        progressColor: kOrangeColor,
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
          margin: EdgeInsets.only(top: 5.h),
          height: 70.h,
          child: Image.asset("assets/images/goal/goal.png"),
        ),
      ],
    );
  }

  Widget _buildMissionDate() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, top: 20.h),
      width: 110.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("2023.09.23", style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold)),
          Text("수요일", style: TextStyle(color: kTextBlackColor)),
        ],
      ),
    );
  }
}
