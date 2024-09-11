
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';
import '../controller/YoungGoalDetailController.dart';

class YoungGoalCalendar extends StatefulWidget {

  YoungGoalDetailController _controller;

  YoungGoalCalendar(this._controller);

  @override
  _YoungGoalCalendarState createState() => _YoungGoalCalendarState();
}

class _YoungGoalCalendarState extends State<YoungGoalCalendar> {

  bool isOpenCalendar = true;
  final List<String> days = ["일", "월", "화", "수", "목", "금", "토"];

  @override
  void dispose() {
    // TODO: implement dispose
    isOpenCalendar = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //todo
        // _buildMonthSuccess(),
        isOpenCalendar?_buildCallendar():Container()
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
                        // Container(
                        //   height: 24.h,
                        //   child: Body1Text(
                        //       "80%",
                        //       wGrey500Color
                        //   ),
                        // ),
                        // Container(
                        //   height: 21.h,
                        //   margin: EdgeInsets.only(top: 6.h),
                        //   child: Body2Text(
                        //       "저번달 평균",
                        //       wGrey500Color
                        //   ),
                        // ),
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
                              "das%",
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
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 30.h),
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
              height: 470.h,
              margin: EdgeInsets.only(top: 10.h),
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 7, // 7 columns for 7 days in a week
                ),
                itemCount: widget._controller.monthPercentage.length,
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
                              backgroundColor: wGrey200Color,
                              circularStrokeCap: CircularStrokeCap.round,
                              percent: widget._controller.monthPercentage[index].percentage!, // Set your percentage here

                              progressColor:wPurpleColor
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
}
