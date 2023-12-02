

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
            margin: EdgeInsets.only(top: 10.h),
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
                  child: Image.asset(youngImagePath + "album/camera.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "부모님께서 모든 사진을 읽었어요.\n새로운 사진을 올려주세요!",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: wGrey800Color),
                  ),
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
                margin: EdgeInsets.only(right: 5.w),
                child: Icon(
                  Icons.cancel,
                  color: wGrey600Color,
                ),
              ),
            ),
          ],
        )
      ],
    ):Container());
  }
}
