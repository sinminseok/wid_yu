import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../goal-conduct/common-goal-conduct/view/CommonConductView.dart';
import '../../../goal-conduct/drug-goal-conduct/view/DrugConductView.dart';
import '../../../goal-conduct/walk-goal-conduct/view/WalkConductView.dart';
import '../../dto/goal/GoalType.dart';
import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class MissionWidget extends StatelessWidget {
  final bool _isOld;
  final GoalResponse _goal;

  MissionWidget(this._isOld,this._goal, );


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        if(_isOld){
          if(_goal.type == "MEDICATION"){
            Get.to(() => DrugConductView(_goal, _isOld));
          }else if(_goal.type == "WALKING"){
            Get.to(() => WalkConductView(_goal, _isOld));
          }else{
            Get.to(() => CommonConductView(_goal, _isOld));
          }
        }else{
          if(_goal.type == "MEDICATION"){
            Get.to(() => DrugConductView(_goal, _isOld));
          }else if(_goal.type == "WALKING"){
            Get.to(() => WalkConductView(_goal, _isOld));
          }else{
            Get.to(() => CommonConductView(_goal, _isOld));
          }
        }


      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            Container(
              width: 335.w,
              margin: EdgeInsets.only(left: 20.w, top: 15.h),
              decoration: BoxDecoration(color: wWhiteColor),
              child: Column(
                children: [
                  Row(
                    children: [

                      InkWell(
                        onTap: (){

                          print(_goal.type);
                        },
                        child: Center(
                            child: Container(
                                width: 43.w,
                                height: 50.h,
                                child: _goal.type == parseGoalTypeToString(GoalType.MEDICATION)?Image.asset("assets/images/mission/drug-mission-icon.png", fit: BoxFit.cover,): _goal.type==parseGoalTypeToString(GoalType.WALKING)?Image.asset("assets/images/mission/walk-mission-icon.png", fit: BoxFit.cover,):Image.asset("assets/images/mission/common-mission-icon.png", )
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h,left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: Title3Text(
                                  _goal.title!,
                                  kTextBlackColor
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.w, top: 5.h),
                              child: Body2Text(
                                  _goal.description!,
                                wGrey800Color
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // times의 길이가 하나면 아래 코드를 사용하고 times의 길이가 2개 이상이면 gridview를 사용해 가로에 2열, 세로로 남은 요소들을 배치한다
            Container(
                margin: EdgeInsets.only(top: 7.h,left: 50.w),

                //todo todo
                child: MissionTimeWidget(_goal.times!, context)),

          ],
        ),
      ),
    );
  }
}
