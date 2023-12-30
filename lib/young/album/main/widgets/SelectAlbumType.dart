
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/album/main/controller/YoungAlbumController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';

class SelectAlbumType extends StatelessWidget {
  YoungAlbumController controller;


  SelectAlbumType(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.showPhotos();
                  },
                  child: Container(
                    width: 153.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: controller.isPhoto
                                ? BorderSide(color: wPurple200Color, width: 3)
                                : BorderSide(
                                color: kTextGreyColor, width: 1))),
                    child: Center(
                      child: Title3Text(
                        "사진",
                        controller.isPhoto ? wPurple200Color : wGrey500Color,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.showVideos();
                  },
                  child: Container(
                    width: 153.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: controller.isVideo
                                ? BorderSide(color: wPurple200Color, width: 3)
                                : BorderSide(
                                color: kTextGreyColor, width: 1))),
                    child: Center(
                      child: Title3Text(
                        "동영상",
                        controller.isVideo ? wPurple200Color : wGrey600Color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        controller.isVideo?Container():Container(
          margin: EdgeInsets.only(
            top: 9.h,
          ),
          width: 320.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              InkWell(
                onTap: () {
                  controller.checkBigShow();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: Row(
                    children: [
                      Container(
                        width: 14.w,
                        height: 14.h,
                        child: Image.asset(commonImagePath +
                            "icon/photo-type-select-icon.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w),
                        child: Text(
                          controller.isBigShow ? "작게보기" : "크게 보기",
                          style: TextStyle(
                              fontFamily: "pretendText",
                              color: controller.isBigShow ? wGrey600Color : wPurpleColor,
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
