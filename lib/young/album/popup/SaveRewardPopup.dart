import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/PurpleButton.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';


class SaveRewardPopup {
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
                    height: 380.h,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 14.h),
                          width: 173.w,
                          height: 175.h,
                          child: Image.asset(
                              commonImagePath + "popup/save_goal.png"),
                        ),
                        Container(
                          child: Text(
                            "저장 완료!",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                                color: wTextBlackColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: Text(
                            "부모님도 올린 사진을 확인할 수 있어요.",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: wTextBlackColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 60.h),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            YoungFrameView(1)),
                                    (route) => false);
                              },
                              child: PurpleButton("앨범으로")),
                        ),

                        // InkWell(
                        //   onTap: (){
                        //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             GoalView()), (route) => false);
                        //   },
                        //   child: Container(
                        //     margin: EdgeInsets.only(top: 20.h),
                        //     width: 250.w,
                        //     height: 44.h,
                        //     decoration: BoxDecoration(
                        //         color: kPurpleColor,
                        //         borderRadius: BorderRadius.all(Radius.circular(10))
                        //     ),
                        //     child: Center(
                        //       child: Text("목록으로",style: TextStyle(color: kTextWhiteColor),),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
