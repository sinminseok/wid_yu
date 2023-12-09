import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/model/mission/TimeType.dart';
import 'package:wid_yu/common/text/CustomText.dart';
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
  ScrollController _scrollController = ScrollController();

  List<Widget> datas = [
    _finishDrugWidget(),
    _finishDrugWidget(),
    _doNotDrugWidget(),
    _doNotDrugWidget(),
    _willDrugWidget(),
    _willDrugWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 335.w,
            height: 300.h,
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
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
        ),
        Positioned(
          top: 180.h,
          left: 320.w,
          child: Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: wWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  ),
                ],
            ),
            child: InkWell(
              onTap: (){
                // 다음 항목으로 스크롤 이동
                _scrollController.animateTo(
                  _scrollController.offset + 120.0, // 조절 가능한 이동 거리
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100),
                );
              },
              child: Center(
                child: Container(
                  width: 15.w,
                    height: 15.h,

                    child: Image.asset("assets/images/icon/next-icon.png",width: 10.w,)),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMissionHeadInfo() {
    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 16.w),
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
                margin: EdgeInsets.only(top: 3.h),
                width: 38.w,
                height: 38.h,
                child: Image.asset(
                  "assets/images/common/mission/drug.png",
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 27.h,
                  margin: EdgeInsets.only(left: 0.w, top: 10.h),
                  child: Title3Text(widget._mission.title, wTextBlackColor),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.w, top: 1.h),
                  child: Body2Text(widget._mission.subtitle, wGrey800Color),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDrugMissions() {
    return Container(
        width: 335.w,
        height: 215.h,
        child: ListView.builder(
            controller: _scrollController, // 추가된 부분
            scrollDirection: Axis.horizontal,
            itemCount: datas.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return datas[idx];
            }));

    // Row(
    //   children: [
    //     _finishDrugWidget(),
    //     _doNotDrugWidget(),
    //     _willDrugWidget(),
    //     _willDrugWidget()
    //   ],
    // ),
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


}

/*
  복용 완료 위젯
   */
Widget _finishDrugWidget() {
  return Container(
    margin: EdgeInsets.only(left: 5.w, top: 20.h),
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
                    margin: EdgeInsets.only(top: 20.h),
                    width: 80.w,
                    height: 109.h,
                    child: Center(
                        child: Image.asset(
                          "assets/images/common/goal/test.png",
                          fit: BoxFit.contain,
                        ))),
                Container(
                  height: 24.h,
                  margin: EdgeInsets.only(top: 3.h),
                  child: Center(
                    child: ChipText("복용 완료", wOrange200Color),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 5.h),
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
                  ChipText("12:00", wWhiteColor),
                  Container(
                      width: 12.w,
                      height: 12.h,
                      margin: EdgeInsets.only(left: 4.w),
                      child: Image.asset("assets/images/icon/check-icon.png"))
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
    margin: EdgeInsets.only(left: 5.w, top: 20.h),
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
                    child: ChipText("미복용", wGrey500Color),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 5.h),
          width: 80.w,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: wGrey300Color),
              color: wGrey200Color),
          child: Center(
            child: ChipText("12:00", wWhiteColor),
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
    margin: EdgeInsets.only(left: 5.w, top: 20.h),
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
                    child: ChipText("복용 예정", wGrey500Color),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 5.h),
          width: 80.w,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: wGrey500Color),
            color: Colors.white,
          ),
          child: Center(
            child: ChipText("12:00", wGrey500Color),
          ),
        )
      ],
    ),
  );
}
