import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/test-controller/TestController.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/album/collect-new-photo/controller/CollectPhotoController.dart';
import 'package:wid_yu/old/album/collect-new-photo/popup/BuyPhotoPopup.dart';
import 'package:wid_yu/old/album/collect-new-photo/widgets/EmptyNewPhoto.dart';
import 'package:wid_yu/old/album/widgets/OldPhotoWidget.dart';
import 'package:wid_yu/old/album/widgets/PointWidget.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

class CollectPhotoView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    CollectPhotoController controller = CollectPhotoController();

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

            PointWidget(),
            // EmptyNewPhoto()
            _buildItemList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    return OldPhotoWidget().blurred(
        colorOpacity: 0.1,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        overlay: _overlayIcon(context));
  }

  Widget _overlayIcon(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            BuyPhotoPopup().showDialog(context);
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
            child: PercentageText("50p", wWhiteColor),
          ),
        )
      ],
    );
  }
}
