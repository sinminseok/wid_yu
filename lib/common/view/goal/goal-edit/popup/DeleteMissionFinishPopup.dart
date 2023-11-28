import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/FilePath.dart';

import '../../../../../young/goal/YoungGoalView.dart';
import '../../../../utils/Color.dart';

class DeleteMissionFinishPopup {
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
                    height: 330.h,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 45.h),
                            width: 125.w,
                            height: 130.h,
                            child: Image.asset(
                                commonImagePath + "popup/delete_icon.png"),
                          ),
                        ),
                        Container(
                          child: Text(
                            "삭제완료!",
                            style: TextStyle(
                                color: wTextBlackColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 270.w,
                            height: 44.h,
                            margin: EdgeInsets.only(top: 60.h),
                            decoration: BoxDecoration(
                                color: wErrorColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Center(
                              child: Text(
                                "확인",
                                style: TextStyle(
                                    color: wWhiteColor, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
