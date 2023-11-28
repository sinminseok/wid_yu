

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/common/view/goal/goal-edit/popup/DeleteMissionFinishPopup.dart';

import '../../../../../young/goal/YoungGoalView.dart';
import '../../../../utils/Color.dart';


class DeleteMissionPopup {
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
                    height: 354.h,
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
                                margin: EdgeInsets.only(top: 5.w, left: 5.w),
                                child: Icon(Icons.close, size: 20.sp, color: wGrey700Color,),
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: 125.w,
                            height: 130.h,
                            child: Image.asset(commonImagePath + "popup/delete_icon.png"),
                          ),
                        ),
                        Container(
                          child: Text("삭제할까요?", style: TextStyle(color: wTextBlackColor, fontSize: 20.sp, fontWeight: FontWeight.w800),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: Text("한번 삭제하면 복구가 안돼요.", style: TextStyle(color: wTextBlackColor, fontSize: 16.sp, fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text("그래도 삭제할까요?", style: TextStyle(color: wTextBlackColor, fontSize: 16.sp, fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          width: 260.w,

                          margin: EdgeInsets.only(bottom: 15.w, top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 95.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                      color: wGrey200Color,
                                      border: Border.all(color: wGrey300Color),
                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Center(
                                    child: Text("취소", style: TextStyle(color: wGrey600Color, fontSize: 16.sp),),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  DeleteMissionFinishPopup().showDialog(context);
                                },
                                child: Container(
                                  width: 155.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                      color: wErrorColor,
                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Center(
                                    child: Text("삭제하기", style: TextStyle(color: wWhiteColor, fontSize: 16.sp),),
                                  ),
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