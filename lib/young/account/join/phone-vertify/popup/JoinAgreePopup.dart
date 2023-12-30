

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

import '../../../../../common/utils/Color.dart';

class JoinAgreePopup {
  void showDialog(BuildContext context) {
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
                    height: 201.h,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15.h, left: 15.w),
                                child: Icon(Icons.close, color: wGrey700Color,),
                              ),
                            ),
                            Container()
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 30.h),
                          child: Title3Text(
                            "약관 동의를 해주세요.",
                            wTextBlackColor
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 40.h),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 138.w,
                                height: 44.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    color: wOrangeColor,
                                  border: Border.all(color: wOrange200Color)
                                ),
                                child: Center(child: Text("확인", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,color: wWhiteColor),)),
                              )),
                        ),

                      ],
                    ),
                  )),
            );
          });
        });
  }
}