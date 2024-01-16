import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/common/view/goal/goal-create/controller/GoalCreateController.dart';

import '../../../../common/utils/Color.dart';
import '../controller/YoungGoalCreateController.dart';


class YoungMissionSetTime extends StatelessWidget {
  YoungGoalCreateController controller;

  YoungMissionSetTime(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 20.w, top: 34.h, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text("복용 시간", wGrey700Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 335.w,
            height: 263.h,
            decoration: BoxDecoration(
                color: wGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                _buildPickTime(),
                _buildPickDrugCount(),
                _buildAddTimeButton(),
              ],
            ),
          ),

        ],
      ),
    ));
  }

  Widget _buildAddTimeButton() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 318.w,
          height: 1.h,
          color: wGrey300Color,
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: InkWell(
            onTap: () {
              if(controller.canAddTime()){
                controller.addTime();
              }else{
                print("안돼");
              }
              controller.validateCanSave();

            },
            child: Center(
              child: ButtonText(
                  "시간 저장",
                  wPurpleColor
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPickTime() {
    return Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 87.w,
                      height: 92.h,
                      decoration: BoxDecoration(
                          color: wWhiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          border: Border.all(color: wGrey300Color)),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectMorning();
                          },
                          child: Container(
                            width: 87.w,
                            height: 46.h,
                            decoration: controller.morning
                                ? BoxDecoration(
                                color: wPurpleBackGroundColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: wPurpleColor))
                                : BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Center(
                                child: ChipText(
                                    "오전",
                                    controller.morning
                                        ? kTextBlackColor
                                        : wGrey500Color)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.selectAfternoon();
                          },
                          child: Container(
                            width: 87.w,
                            height: 46.h,
                            decoration: controller.afternoon
                                ? BoxDecoration(
                                color: wPurpleBackGroundColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: wPurpleColor))
                                : BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Center(
                                child: ChipText(
                                    "오후",
                                    controller.afternoon
                                        ? kTextBlackColor
                                        : wGrey500Color)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 87.w,
                      height: 92.h,
                      decoration: BoxDecoration(
                        color: wWhiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(color: wGrey300Color),
                      ),
                      child: Center(
                        child: TextFormField(
                          onChanged: (value){
                            controller.validateTime();
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.hourController,
                          style: TextStyle(
                              color: Colors.black, // 텍스트 색상을 검정색으로 설정
                              fontSize: 40.sp,
                              fontFamily: "LargeTitle",// 텍스트 크기를 조절
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                          // 가운데 정렬
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero, // 내부 여백 제거
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.w, right: 5.w),
                      height: 100.h,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 40.h),
                              child: Icon(
                                Icons.circle,
                                color: wGrey700Color,
                                size: 10.w,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: Icon(
                                Icons.circle,
                                color: wGrey700Color,
                                size: 10.w,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 87.w,
                      height: 92.h,
                      decoration: BoxDecoration(
                          color: wWhiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: wGrey300Color)),
                      child: Center(
                        child: TextFormField(
                          onChanged: (value){
                            controller.validateTime();
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.minuteController,
                          style: TextStyle(
                              color: Colors.black, // 텍스트 색상을 검정색으로 설정
                              fontSize: 40.sp,
                              fontFamily: "LargeTitle",// 텍스트 크기를 조절
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                          // 가운데 정렬
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero, // 내부 여백 제거
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            controller.isRightTime == -1 ?Container(
              height: 21.h,
              margin: EdgeInsets.only(left: 20.w, top: 3.h),
              child: Helper2Text("잘못된 시간 표현이에요.", wErrorColor),
            ):Container(
              height: 21.h,
              margin: EdgeInsets.only(left: 20.w, top: 3.h),
            )
          ],
        ));
  }

  Widget _buildPickDrugCount() {
    return Container(
      width: 300.w,
      margin: EdgeInsets.only(top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 13.w),
            child: SubTitle2Text(
                "약 개수",
                wGrey700Color
            ),
          ),
          Stack(
            children: [
              Container(
                width: 197.w,
                height: 45.h,
                decoration: BoxDecoration(
                    color: wWhiteColor,
                    border: Border.all(color: wGrey300Color),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Container(
                  margin: EdgeInsets.only(bottom: 6.h),
                  child: TextFormField(
                    onChanged: (value){
                    },
                    keyboardType: TextInputType.number,
                    controller: controller.drugDountController,
                    style: TextStyle(
                        color: Colors.black, // 텍스트 색상을 검정색으로 설정
                        fontSize: 16.sp, // 텍스트 크기를 조절
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 10.h,
                  left: 170.w,
                  child: ChipText(
                      "개",
                      wGrey600Color
                  ))
            ],
          )
        ],
      ),
    );
  }

}
