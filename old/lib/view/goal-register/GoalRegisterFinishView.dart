
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old/view/frame/OldFrameView.dart';
import 'package:old/view/goal/OldGoalView.dart';
import 'package:page_transition/page_transition.dart';

class GoalRegisterFinishView extends StatelessWidget {
  const GoalRegisterFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150.h),
                width: 213.w,
                height: 197.h,
                child: Image.asset("assets/old/goal/goal-register-finish.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              child: Text("수행완료!", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: wGrey700Color),),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              child: Text("꾸준하게 복용해서 얼른 나아요", style: TextStyle(fontSize: 14.sp, color: wGrey600Color),),
            ),
            Container(
              width: 335.w,
              height: 44.h,
              margin: EdgeInsets.only(top: 160.h),
              decoration: BoxDecoration(
                color: wPurpleColor,
                borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: OldFrameView(),
                    ),
                  );
                },
                child: Center(
                  child: Text("확인", style: TextStyle(color: kTextWhiteColor, fontWeight: FontWeight.bold, fontSize: 16.sp),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
