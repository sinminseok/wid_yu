import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/model/user/Old.dart';
import '../../../common/utils/Color.dart';
import '../join/JoinFinishView.dart';
import '../join/OtherOldInformationView.dart';

class AccountPopup {
  void showDialog(BuildContext context, Old old) {
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
                    width: 320.w,
                    height: 230.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 15.w, top: 10.h),
                                child: Icon(Icons.close),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.h),
                          child: Center(
                            child: Text(
                              "또 다른 부모님의 계정도\n추가로 생성할까요?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60.h),
                          width: 315,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child:
                                              (OtherOldInformationView(old))));
                                },
                                child: Container(
                                  width: 156.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: wOrangeColor),
                                  child: Center(
                                    child: Text(
                                      "추가 생성하기",
                                      style: TextStyle(
                                          color: kTextWhiteColor,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: (JoinFinishView())));
                                },
                                child: Container(
                                  width: 114.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.grey.shade400),
                                  child: Center(
                                    child: Text(
                                      "건너뛰기",
                                      style: TextStyle(
                                          color: kTextGreyColor,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
