
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';
import '../popup/DeleteDiseasePopup.dart';

Widget DiseaseInformationWidget(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 335.w,
    decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border.all(color: wGrey100Color),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        Container(
          width: 310.w,
          height: 30.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              InkWell(
                onTap: () {
                  DeleteDiseasePopup().showDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 10.h,
                  ),
                  width: 18.w,
                  height: 18.h,
                  child: Icon(
                    Icons.cancel,
                    color: wGrey600Color,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 13.h),
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "주소",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              ),
              Container(
                child: Text(
                  "오목로11길 5",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 308.w,
          height: 1.h,
          color: wGrey300Color,
        ),
        Container(
          margin: EdgeInsets.only(top: 13.h),
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "복용 중인 약",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              ),
              Container(
                child: Text(
                  "오목로11길 5",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 308.w,
          height: 1.h,
          color: wGrey300Color,
        ),
        Container(
          margin: EdgeInsets.only(top: 13.h),
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "자주가는 병원",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              ),
              Container(
                child: Text(
                  "오목로11길 5",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 308.w,
          height: 1.h,
          color: wGrey300Color,
        ),
        Container(
          margin: EdgeInsets.only(top: 13.h),
          width: 310.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "설명",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  "질병관련, 약 관련, 병원관련 설명 100자까지 질병관련, 약 관련, 병원관련 설명 100자까지 질병관련, 약 관련, 병원관련 설명 100자까지 질병관련, 약 관련, 병원관련",
                  style:
                  TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}