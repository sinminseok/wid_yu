import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';

import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';

class SaveOldInformation extends StatelessWidget {
  OldUser old;

  SaveOldInformation(this.old);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 335.w,
        margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: wWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 3,
                    blurRadius: 9,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                child: ExpansionTile(
                  iconColor: wGrey600Color,
                  initiallyExpanded: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: Title3Text(
                          "${old.name} 님의 정보",
                          wGrey800Color,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    _buildUserInformation(),
                    old.disease == null
                        ? Container()
                        : _buildDiseaseInformation(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildDiseaseInformation() {
    return Column(
      children: [
        Container(
            child: Column(
          children: [
            Container(
              width: 270.w,
              margin: EdgeInsets.only(top: 45.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: SubTitle2Text(
                        "질병 이름",
                        wGrey600Color,
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Body1Text(
                        "질병 이름",
                        wTextBlackColor,
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 315,
                color: wGrey300Color,
                height: 1)
          ],
        )),
        Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Container(
                  width: 270.w,
                  margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: SubTitle2Text(
                            "복용 중인 약",
                            wGrey600Color,
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Body1Text(
                            "약이름",
                            wTextBlackColor,
                          )),
                    ],
                  ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: 0.h),
            width: 315,
            color: wGrey300Color,
            height: 1),
        Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Container(
                  width: 270.w,
                  margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: SubTitle2Text(
                            "설명",
                            wGrey600Color,
                          )),
                    ],
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.only(right: 30.w, left: 30.w, bottom: 20.h),
                    child: Body1Text(
                      "설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~설명~ㅍ",
                      wTextBlackColor,
                    )),
              ],
            )),
      ],
    );
  }

  Widget _buildUserInformation() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Container(
                  width: 270.w,
                  margin: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: SubTitle2Text(
                            "이름",
                            wGrey600Color,
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Body1Text(
                            "${old.name}",
                            wTextBlackColor,
                          )),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15.h),
                    width: 315,
                    color: wGrey300Color,
                    height: 1)
              ],
            )),
        Container(
            child: Column(
          children: [
            Container(
              width: 270.w,
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: SubTitle2Text(
                        "연락처",
                        wGrey600Color,
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Body1Text(
                        "${old.phoneNumber}",
                        wTextBlackColor,
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 315,
                color: wGrey300Color,
                height: 1)
          ],
        )),
        Container(
            child: Column(
          children: [
            Container(
              width: 270.w,
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: SubTitle2Text(
                        "집주소",
                        wGrey600Color,
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Body1Text(
                        "${old.address}",
                        wTextBlackColor,
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 315,
                color: wGrey300Color,
                height: 1)
          ],
        )),
        Container(
            margin: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                Container(
                  width: 270.w,
                  margin: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: SubTitle2Text(
                            "출생연도",
                            wGrey600Color,
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Body1Text(
                            "${old.brith}",
                            wTextBlackColor,
                          )),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
