import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/common/view/goal/goal/DrugImageDetailView.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';

import '../../../final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import '../../utils/Color.dart';

/*
 목표 상세 페이지에 사용될 약 복용 미션 위젯
 */
class DrugMissionWidget extends StatefulWidget {
  final List<GoalResponse> _goals;

  DrugMissionWidget(this._goals);

  @override
  State<DrugMissionWidget> createState() => _DrugMissionWidget();
}

class _DrugMissionWidget extends State<DrugMissionWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget._goals.map((e) => _buildCard(e)).toList(),
    );
  }

  Widget _buildCard(GoalResponse goal) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 335.w,
            height: 320.h,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kLightGreyColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                _buildMissionHeadInfo(goal),
                _buildDrugMissions(goal),
              ],
            ),
          ),
        ),
        Positioned(
          top: 180.h,
          left: 335.w,
          child: Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.7),
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
              onTap: () {
                // 다음 항목으로 스크롤 이동
                _scrollController.animateTo(
                  _scrollController.offset + 120.0, // 조절 가능한 이동 거리
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100),
                );
              },
              child: Center(
                child: Container(
                    width: 11.w,
                    height: 11.h,
                    child: Image.asset(
                      "assets/images/icon/next-icon.png",
                      width: 10.w,
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMissionHeadInfo(GoalResponse goal) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 16.w),
      child: Row(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 3.h),
              child: Image.asset(
                width: 55.w,
                height: 55.h,
                "assets/images/mission/drug-mission-icon.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 27.h,
                  margin: EdgeInsets.only(left: 0.w, top: 10.h),
                  child: Title3Text(goal.title!, wTextBlackColor),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.w, top: 1.h),
                  child: Body2Text(goal.description!, wGrey800Color),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDrugMissions(GoalResponse goal) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: 335.w,
          height: 215.h,
          child: Container(
            margin: EdgeInsets.only(left: 5.w, right: 7.w),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _scrollController,
                // 추가된 부분
                scrollDirection: Axis.horizontal,
                itemCount: goal.times!.length,
                itemBuilder: (BuildContext ctx, int idx) {
                  return _filter(goal.times![idx]);
                }),
          )),
    );

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

  Widget _filter(GoalTimeResponse goalResponse) {
    if (goalResponse.status == -1) {
      return _doNotDrugWidget(goalResponse);
    } else if (goalResponse.status == 0) {
      return _willDrugWidget(goalResponse);
    } else {
      return _finishDrugWidget(goalResponse);
    }
  }
}

/*
  복용 완료 위젯
   */
Widget _finishDrugWidget(GoalTimeResponse goalResponse) {
  return Container(
    margin: EdgeInsets.only(left: 7.w, top: 20.h),
    child: Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 100.w,
            height: 180.h,
            decoration: BoxDecoration(
              color: wWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: wOrange200Color),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => DrugImageDetailView(goalResponse));
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 20.h),
                      width: 80.w,
                      height: 109.h,
                      child: Center(
                          child: Image.network(
                        "${goalResponse.imgUrl}",
                        fit: BoxFit.fitHeight,
                      ))),
                ),
                Container(
                  height: 24.h,
                  margin: EdgeInsets.only(top: 13.h),
                  child: Center(
                    child: ChipText("복용 완료", wOrange200Color),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 0.h),
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
              ChipText("${goalResponse.time}", wWhiteColor),
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
Widget _doNotDrugWidget(GoalTimeResponse goalResponse) {
  return Container(
    margin: EdgeInsets.only(left: 7.w, top: 20.h),
    child: Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 100.w,
            height: 180.h,
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
                  width: 48.w,
                  height: 48.h,
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
            child: ChipText("${goalResponse.time}", wWhiteColor),
          ),
        )
      ],
    ),
  );
}

/*
  복용 예정 위젯
   */
Widget _willDrugWidget(GoalTimeResponse goalResponse) {
  return Container(
    margin: EdgeInsets.only(left: 7.w, top: 20.h),
    child: Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 100.w,
            height: 180.h,
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
                    width: 48.w,
                    height: 48.h,
                    child: Center(
                        child: Image.asset(
                            "assets/images/mission/drug-mission-icon.png")),
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
            child: ChipText("${goalResponse.time}", wGrey500Color),
          ),
        )
      ],
    ),
  );
}
