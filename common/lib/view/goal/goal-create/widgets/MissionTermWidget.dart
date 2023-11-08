

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/Color.dart';

class MissionTermWidget extends StatefulWidget {
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;


  MissionTermWidget(this.monday, this.tuesday, this.wednesday, this.thursday,
      this.friday, this.saturday, this.sunday);

  @override
  _MissionTermWidgetState createState() => _MissionTermWidgetState();
}

class _MissionTermWidgetState extends State<MissionTermWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.h, left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "복용주기",
                style: TextStyle(
                    color: wGrey700Color,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.monday = !widget.monday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.monday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("월",
                            style: TextStyle(
                                color: widget.monday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.tuesday = !widget.tuesday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.tuesday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("화",
                            style: TextStyle(
                                color:
                                widget.tuesday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.wednesday = !widget.wednesday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.wednesday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("수",
                            style: TextStyle(
                                color:
                                widget.wednesday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.thursday = !widget.thursday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.thursday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("목",
                            style: TextStyle(
                                color:
                                widget.thursday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.friday = !widget.friday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.friday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("금",
                            style: TextStyle(
                                color: widget.friday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.saturday = !widget.saturday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.saturday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("토",
                            style: TextStyle(
                                color:
                                widget.saturday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.sunday = !widget.sunday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: widget.sunday
                          ? BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)))
                          : BoxDecoration(
                          color: wGrey100Color,
                          border: Border.all(color: wGrey300Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text("일",
                            style: TextStyle(
                                color: widget.sunday ? kTextWhiteColor : wGrey500Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}


