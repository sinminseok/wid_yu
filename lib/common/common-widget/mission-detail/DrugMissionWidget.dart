import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/model/mission/TimeType.dart';
import 'package:wid_yu/common/utils/FilePath.dart';

import '../../model/mission/Mission.dart';
import '../../model/mission/MissionTime.dart';
import '../../utils/Color.dart';

/*
 목표 상세 페이지에 사용될 약 복용 미션 위젯
 */
class DrugMissionWidget extends StatefulWidget {
  final Mission _mission;

  DrugMissionWidget(this._mission);

  @override
  State<DrugMissionWidget> createState() => _DrugMissionWidget();
}

class _DrugMissionWidget extends State<DrugMissionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 335.w,
        height: 300.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kLightGreyColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            _buildMissionHeadInfo(),
            _buildDrugMissions(),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionHeadInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: Row(
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
              child: Container(
                width: 28.w,
                height: 28.h,
                child: Image.asset("assets/common/icon/mission/drug.png"),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
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
                margin: EdgeInsets.only(left: 20.w, top: 5.h),
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
      ),
    );
  }

  Widget _buildDrugMissions() {
    return Container(
      width: 335.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _finishDrugWidget(),
            _doNotDrugWidget(),
            _willDrugWidget(),
            _willDrugWidget()
          ],
        ),
      ),
    );

    /*
        API 연동 후 아래 코드 사용
         */
    // Container(
    //   width: 335.w,
    //   child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: drugTimes.asMap().entries.map((entry) {
    //           final index = entry.key;
    //           final time = entry.value;
    //           return _buildDrugMission();
    //         }).toList(),
    //       )
    //   ),
    // );
  }

  /*
  복용 완료 위젯
   */
  Widget _finishDrugWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15.h),
              width: 100.w,
              height: 165.h,
              decoration: BoxDecoration(
                color: wWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: wOrange200Color),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80.w,
                    height: 109.h,
                    child: Center(
                      child: Text(
                        "약 사진",
                        style: TextStyle(color: kTextBlackColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Center(
                      child: Text(
                        "복용 완료",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: wOrangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            width: 80.w,
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: wOrange200Color),
                color: wOrangeColor),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "12:00",
                  style: TextStyle(
                    color: wWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 3.w),
                  child: Icon(
                    Icons.check,
                    color: wWhiteColor,
                    size: 15.w,
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  /*
  미복용 위젯
   */
  Widget _doNotDrugWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15.h),
              width: 100.w,
              height: 165.h,
              decoration: BoxDecoration(
                color: wGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: wGrey200Color),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    width: 40.w,
                    height: 40.h,
                    child: Center(
                        child: Image.asset(
                            commonImagePath + "icon/mission/no-drug.png")),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Center(
                      child: Text(
                        "미복용",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: wGrey500Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            width: 80.w,
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: wGrey300Color),
                color: wGrey200Color),
            child: Center(
              child: Text(
                "12:00",
                style: TextStyle(
                  color: wWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /*
  복용 예정 위젯
   */
  Widget _willDrugWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15.h),
              width: 100.w,
              height: 165.h,
              decoration: BoxDecoration(
                color: kLightGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: kLightGreyColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 53.h),
                      width: 37.w,
                      height: 37.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: wWhiteColor),
                      child: Center(
                          child: Image.asset(
                              "assets/common/icon/mission/drug.png")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Center(
                      child: Text(
                        "복용 예정",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: wGrey500Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            width: 80.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: kLightGreyColor),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                "12:00",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
