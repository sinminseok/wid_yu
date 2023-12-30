

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/Color.dart';

class EmptyGoal extends StatefulWidget {
  const EmptyGoal({Key? key}) : super(key: key);

  @override
  _EmptyGoalState createState() => _EmptyGoalState();
}

class _EmptyGoalState extends State<EmptyGoal>     with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 및 Tween 초기화
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // 애니메이션 반복 설정
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 410.h,
      decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border.all(color: wGrey100Color),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120.h),
            width: 35.w,
            height: 35.h,
            child: Image.asset("assets/images/icon/face-icon.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Helper2Text("새로운 목표를 생성해 보세요!", wGrey500Color),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: Container(
                  margin: EdgeInsets.only(left: 180.w, top: 10.h),
                  width: 77.w,
                  height: 130.h,
                  child: Image.asset("assets/images/icon/bottom-arrow-icon.png"),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
