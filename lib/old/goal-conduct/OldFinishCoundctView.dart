import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/model/mission/Mission.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/old/goal/OldGoalView.dart';

class OldFinishConductView extends StatefulWidget {
  final Mission mission;

  OldFinishConductView(this.mission);

  @override
  _OldFinishConductViewState createState() => _OldFinishConductViewState();
}

class _OldFinishConductViewState extends State<OldFinishConductView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _buildBestImage(),
              _buildMainText(),
            ],
          ),
          _buildButton(),
        ],
      ),
    );
  }
  
  Widget _buildButton(){
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: (OldFrameView(0))));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        width: 335.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: wPurpleColor,
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Center(
          child: Text("확인", style: TextStyle(color: wWhiteColor,fontSize: 16.sp, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }

  Widget _buildMainText(){
    return Column(

      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h),
          child: Text("수행완료", style: TextStyle(color: wGrey800Color, fontSize: 24.sp,fontWeight: FontWeight.bold),),
        ),
        Container(
          margin: EdgeInsets.only(top: 6.h),
          child: Text("꾸준하게 복용해서 얼른 나아요", style: TextStyle(color: wGrey600Color, fontSize: 14.sp,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }

  Widget _buildBestImage() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 120.h),
        width: 213.w,
        height: 193.h,
        child: Image.asset(commonImagePath + "goal-conduct/best.png"),
      ),
    );
  }
}
