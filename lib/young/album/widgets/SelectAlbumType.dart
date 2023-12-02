
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/album/controller/YoungAlbumController.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

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
                    width: 158.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: controller.isPhoto
                                ? BorderSide(color: wPurpleColor, width: 2)
                                : BorderSide(
                                color: kTextGreyColor, width: 0.5))),
                    child: Center(
                      child: Text(
                        "사진",
                        style: TextStyle(
                            color: controller.isPhoto ? wPurpleColor : wGrey500Color,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.showVideos();
                  },
                  child: Container(
                    width: 158.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: controller.isVideo
                                ? BorderSide(color: wPurpleColor, width: 2)
                                : BorderSide(
                                color: kTextGreyColor, width: 0.5))),
                    child: Center(
                      child: Text(
                        "비디오",
                        style: TextStyle(
                            color: controller.isVideo ? wPurpleColor : wGrey600Color,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
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
                          controller.isBigShow ? "크게 보기" : "작게 보기",
                          style: TextStyle(
                              color: controller.isBigShow ? wPurpleColor : wGrey600Color,
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
