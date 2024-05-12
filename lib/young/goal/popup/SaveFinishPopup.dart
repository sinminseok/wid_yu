

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';
import '../main/view/YoungGoalView.dart';

class SaveFinishPopup {
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
                  width: 345.w,
                  height: 409.h,
                  child: Column(
                    children: [
                      Container(
                        width: 200.w,
                        height: 235.h,
                        child: Image.asset("assets/common/popup/save_goal.png"),
                      ),
                      Container(
                        child: Center(
                          child: Text("저장 완료!",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 20.sp),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        child: Center(
                          child: Text("이제 목표를 수행하러 가볼까요?",style: TextStyle(color: kTextBlackColor, fontSize: 18.sp),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  YoungGoalView()), (route) => false);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 60.h),
                          width: 250.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: wPurpleColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("목록으로",style: TextStyle(color: wWhiteColor),),
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