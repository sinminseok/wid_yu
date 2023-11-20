

import 'package:common/utils/Color.dart';
import 'package:common/utils/FilePath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/goal/YoungGoalView.dart';

class DeleteDiseasePopup {
  void showDialog( BuildContext context) {
    showGeneralDialog(
        context: context,
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
                    height: 354.h,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.h,left: 10.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 16.w,
                                  height: 16.h,
                                  child: Icon(Icons.close),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 125.w,
                          height: 132.h,
                          child: Image.asset(commonImagePath+"popup/delete_icon.png"),
                        ),
                        Container(
                          child: Center(
                            child: Text("삭제할까요?",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 20.sp),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: Center(
                            child: Text("한번 삭제하면 복구가 안돼요.\n그래도 삭제할까요?",style: TextStyle(color: kTextBlackColor, fontSize: 18.sp),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 38.h),
                          width: 310,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                      color: wGrey200Color,
                                      border: Border.all(color: wGrey300Color),
                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Center(
                                    child: Text("취소", style: TextStyle(color: wGrey600Color, fontWeight: FontWeight.w600, fontSize: 16.sp),),
                                  ),
                                ),
                              ),
                              Container(
                                width: 165.w,
                                height: 44.h,
                                decoration: BoxDecoration(
                                    color: wErrorColor,
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                ),
                                child: Center(
                                  child: Text("삭제하기", style: TextStyle(color: kTextWhiteColor, fontWeight: FontWeight.w600, fontSize: 16.sp),),
                                ),
                              ),
                            ],
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

// Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
// builder: (BuildContext context) =>
// YoungGoalView()), (route) => false);