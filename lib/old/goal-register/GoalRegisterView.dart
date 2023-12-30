

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/common-widget/appbar/CommonAppbar.dart';
import '../../common/utils/Color.dart';
import 'GoalRegisterFinishView.dart';

class GoalRegisterView extends StatefulWidget {
  const GoalRegisterView({Key? key}) : super(key: key);

  @override
  _GoalRegisterViewState createState() => _GoalRegisterViewState();
}

class _GoalRegisterViewState extends State<GoalRegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(canBack: true, color: wWhiteColor, title: '목표 등록',),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.h),
              child: Center(
                child: Text("이 사진과 함께 목표 수행을 완료할까요?", style: TextStyle(color: wGrey700Color, fontSize: 20.sp, fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:30.h),
              width: 332.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: wGrey300Color,
                borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
            Container(
              width: 335.w,
              margin: EdgeInsets.only(top: 50.h),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: 108.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: wGrey200Color,
                        border: Border.all(color: wGrey300Color),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(
                        child: Text("다시찍기", style: TextStyle(fontSize: 16.sp, color: wGrey600Color, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: GoalRegisterFinishView(),
                        ),
                      );
                    },
                    child: Container(
                      width: 221.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          color: wOrangeColor,
                          border: Border.all(color: wOrange200Color),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(
                        child: Text("완료하기", style: TextStyle(fontSize: 16.sp, color: wWhiteColor, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
