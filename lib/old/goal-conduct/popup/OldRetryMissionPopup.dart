

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

import '../../../common/utils/Color.dart';

class OldRetryMissionPopup {
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
                    height: 381.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15.h,right: 15.w),
                                child: Icon(Icons.close, color: wGrey500Color,),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 151.w,
                          height: 131.h,
                          child: Image.asset(commonImagePath + "goal-conduct/bell.png"),
                        ),
                        Column(
                          children: [

                            Container(
                              child: Center(
                                child: Text("5분뒤에 다시 알림이 가요.",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 20.sp),),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: Center(
                                child: Text("조금 이따 다시 만나요!",style: TextStyle(color: kTextBlackColor, fontSize: 18.sp),),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OldFrameView(0)), (route) => false);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            width: 250.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                color: wPurpleColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("확인",style: TextStyle(color: wWhiteColor),),
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