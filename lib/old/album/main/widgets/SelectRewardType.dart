

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/album/main/controller/OldAlbumController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';

class SelectRewardType extends StatelessWidget {
  OldAlbumController controller;


  SelectRewardType(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        _buildSelectRewardType(),
       //_buildBigOrSmall(),
      ],
    ));
  }

  Widget _buildSelectRewardType(){
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                controller.selectPhoto();
              },
              child: Container(
                width: 170.w,
                height: 60.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: controller.isPhoto
                            ? BorderSide(color: wOrangeColor, width: 2)
                            : BorderSide(
                            color: kTextGreyColor, width: 0.5))),
                child: Center(
                  child: Title3Text(
                      "사진",
                      controller.isPhoto ? wOrange200Color : wGrey500Color
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.selectVideo();
              },
              child: Container(
                width: 170.w,
                height: 60.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: controller.isVideo
                            ? BorderSide(color: wOrange200Color, width: 2)
                            : BorderSide(
                            color: kTextGreyColor, width: 0.5))),
                child: Center(
                  child: Title3Text(
                      "비디오",
                      controller.isVideo ? wOrange200Color : wGrey500Color

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBigOrSmall(){
    return  Container(
      margin: EdgeInsets.only(top: 9.h, bottom: 14.h),
      width: 320.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          InkWell(
            onTap: () {
              controller.clickBigShow();
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
                      controller.isBigShow ? "작게 보기" : "크게 보기",
                      style:
                      TextStyle(color: controller.isBigShow ? wGrey600Color:wPurpleColor, fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
