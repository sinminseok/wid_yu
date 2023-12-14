

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/album/controller/YoungAlbumController.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

class AllRead extends StatelessWidget {
  YoungAlbumController controller;


  AllRead(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isReadAlarm ? Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
            width: 335.w,
            height: 75.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(4, 4),
                    color: Colors.black.withOpacity(0.2),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: wWhiteColor),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 74.w,
                  height: 74.h,
                  child: Image.asset(youngImagePath + "album/camera.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 21.h,
                      margin: EdgeInsets.only(left: 5.w, top: 15.h),
                      child: SubTitle2Text(
                          "부모님께서 모든 사진을 읽었어요.",
                          wGrey800Color
                      ),
                    ),
                    Container(
                      height: 21.h,
                      margin: EdgeInsets.only(left: 5.w, top: 4.h),
                      child: SubTitle2Text(
                          "새로운 사진을 올려주세요!",
                          wGrey800Color
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            InkWell(
              onTap: () {
                controller.checkReadAlarm();
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Icon(
                  Icons.cancel,
                  color: wGrey500Color,
                ),
              ),
            ),
          ],
        )
      ],
    ):Container());
  }
}
