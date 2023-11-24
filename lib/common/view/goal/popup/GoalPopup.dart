import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';

import '../../../../young/goal/YoungGoalView.dart';
import '../../../utils/Color.dart';
import '../goal-create/GoalCreateView.dart';

class GoalPopup {
  void createGoalPopup(BuildContext context,bool isOld) {
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
                    height: 379.h,
                    child: Column(
                      children: [
                        Container(
                          width: 173.w,
                          height: 175.h,
                          child:
                              Image.asset("assets/common/popup/save_goal.png"),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "저장 완료!",
                              style: TextStyle(
                                  color: wTextBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "이제 목표를 수행하러 가볼까요?",
                              style: TextStyle(
                                  color: wTextBlackColor, fontSize: 16.sp),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            isOld == true ?Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: OldFrameView(0),
                              ),
                            ):
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: YoungFrameView(0),
                              ),
                            );
                          },
                          child: Container(
                            width: 260.w,
                            height: 44.h,
                            margin: EdgeInsets.only(top: 80.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: wPurple200Color),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              color: wPurpleColor
                            ),
                            child: Center(
                              child: Text("목록으로", style: TextStyle(color: wWhiteColor, fontWeight: FontWeight.bold, fontSize: 16.sp),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
