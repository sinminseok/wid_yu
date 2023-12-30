

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

import '../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';


class BuyPhotoFinishPopup {
  void showDialog( BuildContext context) {
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
              content:         Container(
                width: 355.w,
                height: 338.h,
                decoration: BoxDecoration(
                    color: wWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.h, left: 10.w),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: wGrey700Color,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      child: Title2Text("구매완료", wTextBlackColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.h),
                      width: 129.w,
                      height: 136.h,
                      child: Image.asset(
                          "assets/images/old/reward/reward-photo.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4.w),
                            width:98.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: wOrange200Color),
                                borderRadius: BorderRadius.all(Radius.circular(6))),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: ButtonText("다른사진 구매", wOrange200Color),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4.w),
                            width: 170.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                                color: wOrangeColor,
                                border: Border.all(color: wOrange200Color)),
                            child: InkWell(
                              onTap: () {
                                Get.offAll(() => OldFrameView(1));
                              },
                              child: Center(
                                child: ButtonText("구매한 사진 보기", wWhiteColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            );
          });
        });
  }
}