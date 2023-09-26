import 'package:common/model/mission/Mission.dart';
import 'package:common/model/mission/MissionType.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MissionWidget extends StatefulWidget {
  final Mission _mission;


  MissionWidget(this._mission);

  @override
  _MissionWidgetState createState() => _MissionWidgetState();
}

class _MissionWidgetState extends State<MissionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 335.w,
            margin: EdgeInsets.only(left: 20.w, top: 20.h),
            decoration: BoxDecoration(color: kTextWhiteColor),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Text(
                            widget._mission.title,
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w, top: 5.h),
                          child: Text(
                            widget._mission.subtitle,
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h, left: 30.w, bottom: 10.h),
            width: 250.w,
            height: 30.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                "19:00",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
