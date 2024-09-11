import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

import '../../../../common/utils/Color.dart';
import '../../../common/utils/CustomText.dart';
import '../../../young/family-manager/dto/OldInformationResponseDto.dart';
import '../../../young/family-manager/dto/YoungInformationResponseDto.dart';
import '../../../young/health-infroamtion/dto/HealthAllResponse.dart';

class HealthInformationPopup {
  void createGoalPopup(HealthAllResponse data,  BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: DefaultTextStyle(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          color: wWhiteBackGroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      ),

                      width: 345.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.h, left: 5.w),
                                  child: Icon(Icons.close),
                                ),
                              ),
                              Container()
                            ],
                          ),
                          Center(
                            child: Container(
                              child: Title3Text("${data.responseOldHealthDto.name}님 정보", kTextBlackColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 27.h, left: 10.w),
                            child: Body2Text(
                                DateFormat('yyyy.MM.dd HH:mm').format(DateTime.now()),
                                // 포맷된 날짜와 시간 사용
                                wGrey600Color),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              width: 335.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(color: wGrey100Color, width: 2.w)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10.h, left: 10.w),
                                    child: SubTitle2Text("심박수", wGrey600Color),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.h, left: 10.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Title1Text("${data.heartBit}", kTextBlackColor),
                                        ),
                                        Container(
                                          child: SubTitle2Text("bpm", wGrey600Color),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              width: 335.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(color: wGrey100Color, width: 2.w)),
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w, right: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //연락처
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                      width: 310.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: SubTitle2Text("연락처", kTextBlackColor),
                                          ),
                                          Container(
                                            child: Body1Text("${data.responseOldHealthDto.phoneNumber}", kTextBlackColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 308.w,
                                      height: 1.h,
                                      color: wGrey300Color,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                      width: 310.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: SubTitle2Text("집주소", kTextBlackColor),
                                          ),
                                          Container(
                                            width: 203.w,
                                            child: Text(
                                              "${data.responseOldHealthDto.address}",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: kTextBlackColor,
                                                  fontSize: 16.sp,
                                                  fontFamily: "Body1",
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 308.w,
                                      height: 1.h,
                                      color: wGrey300Color,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                      width: 310.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: SubTitle2Text("출생연도", kTextBlackColor),
                                          ),
                                          Container(
                                            width: 203.w,
                                            child: Text(
                                              "${data.responseOldHealthDto.birth}",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: kTextBlackColor,
                                                  fontSize: 16.sp,
                                                  fontFamily: "Body1",
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: data.responseOldHealthDto.diseases.map((disase) {
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  width: 335.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: wGrey100Color, width: 2.w)),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        //연락처
                                        Container(
                                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                          width: 310.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: SubTitle2Text("질병 이름", kTextBlackColor),
                                              ),
                                              Container(
                                                child: Body1Text("${disase.name}", kTextBlackColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 308.w,
                                          height: 1.h,
                                          color: wGrey300Color,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                          width: 310.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: SubTitle2Text("복용 약", kTextBlackColor),
                                              ),
                                              Container(
                                                width: 203.w,
                                                child: Text(
                                                  "${disase.drugName}",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      color: kTextBlackColor,
                                                      fontSize: 16.sp,
                                                      fontFamily: "Body1",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 308.w,
                                          height: 1.h,
                                          color: wGrey300Color,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                          width: 310.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: SubTitle2Text("설명", kTextBlackColor),
                                              ),
                                              Container(
                                                width: 203.w,
                                                child: Text(
                                                  "${disase.explanation}",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      color: kTextBlackColor,
                                                      fontSize: 16.sp,
                                                      fontFamily: "Body1",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.h,left: 10.w),
                            child: SubTitle1Text("보호자 연락처", kTextBlackColor),
                          ),
                          Column(
                            children: data.responseYoungInfoDto.map((young) {
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  width: 335.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: wGrey100Color, width: 2.w)),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        //연락처
                                        Container(
                                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                          width: 310.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: SubTitle2Text("이름", kTextBlackColor),
                                              ),
                                              Container(
                                                child: Body1Text("${young.name}", kTextBlackColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 308.w,
                                          height: 1.h,
                                          color: wGrey300Color,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                          width: 310.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: SubTitle2Text("연락처", kTextBlackColor),
                                              ),
                                              Container(
                                                width: 203.w,
                                                child: Text(
                                                  "${young.phoneNumber}",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      color: kTextBlackColor,
                                                      fontSize: 16.sp,
                                                      fontFamily: "Body1",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 308.w,
                                          height: 1.h,
                                          color: wGrey300Color,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                          width: 310.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: SubTitle2Text("집주소", kTextBlackColor),
                                              ),
                                              Container(
                                                width: 203.w,
                                                child: Text(
                                                  "${young.address}",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      color: kTextBlackColor,
                                                      fontSize: 16.sp,
                                                      fontFamily: "Body1",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          });
        });
  }
}
