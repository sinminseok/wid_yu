

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/view/EditYoungView.dart';

import '../../../../../common/utils/Color.dart';

class ShowFamilyPopup {
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
              content: DefaultTextStyle(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  child: Container(
                    width: 335.w,
                    height: 233.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15.h,left: 15.w),
                                child: Icon(Icons.close, color: wGrey500Color,),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 32.h),
                            child: Title3Text("모든 화면에서 이름이", wTextBlackColor)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6.h),
                            child: Title3Text("가족관계로 표시됩니다.", wTextBlackColor)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40.h),
                          width: 133.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: wOrangeColor,
                            border: Border.all(color: wOrange200Color)
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: ButtonText("확인", wWhiteColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
            );
          });
        });
  }
}