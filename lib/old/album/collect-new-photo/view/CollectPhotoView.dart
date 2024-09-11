import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/SnackBar.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import 'package:wid_yu/old/album/collect-new-photo/popup/BuyPhotoPopup.dart';
import 'package:wid_yu/old/album/main/controller/OldAlbumController.dart';
import 'package:wid_yu/old/album/widgets/OldPhotoWidget.dart';
import 'package:wid_yu/old/album/widgets/PointWidget.dart';

import '../../../../common/utils/FilePath.dart';

class CollectPhotoView extends StatelessWidget {
  OldAlbumController _controller;

  CollectPhotoView(this._controller);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: wOrangeBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: "새로운 사진 모으기",
        color: wOrangeBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PointWidget(_controller.point!),
            // EmptyNewPhoto()
          Column(
            children: _controller.lockRewards.map((photo) {
              return _buildItem(context, photo);
            }).toList(),
          )
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, YoungRewardReadResponse reward) {
    return _buildBlurContainer().blurred(
        colorOpacity: 0.1,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        overlay: _overlayIcon(context , reward));
  }

  Widget _buildBlurContainer() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h, bottom: 10.h),
        width: 375.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: wWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              spreadRadius: 5,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 13.h, left: 21.w),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: wGrey200Color),
                          child: Image.asset(
                              commonImagePath + "user/youngMan.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 9.w),
                          child: SubTitle2Text("이승철 님", wTextBlackColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
              width: 335.w,
              height: 210.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: Image.asset(
                    "assets/common/album/family_photo.png",
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h, bottom: 20.h),
              width: 310.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 235.w,
                    height: 55.h,
                    child: Text(
                      "dasd!",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.8.h,
                          fontFamily: "body2",
                          color: kTextBlackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int?> getPoint()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getInt("point");
  }

  Widget _overlayIcon(BuildContext context, YoungRewardReadResponse reward) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async{
            int? point  = await getPoint();

            if(point! <= 0 ){
              CustomSnackBar().show(context, "포인트가 부족합니다.");
            }else{
              BuyPhotoPopup().showDialog(context, reward, point!);
            }

          },
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
            child: Image.asset(
              "assets/images/icon/rock-icon2.png",
              width: 21.w,
              height: 21.h,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 14.sp),
          width: 60.w,
          height: 40.h,
          decoration: BoxDecoration(
              border: Border.all(color: wOrange200Color),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: wOrangeColor),
          child: Center(
            child: PercentageText("${reward.point}p", wWhiteColor),
          ),
        )
      ],
    );
  }
}
