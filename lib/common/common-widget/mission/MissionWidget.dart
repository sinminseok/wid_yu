import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalType.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../dto/goal/GoalTime.dart';
import '../../dto/goal/GoalTimeStatus.dart';
import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class MissionWidget extends StatelessWidget {
  final Goal _goal;

  MissionWidget(this._goal, );


  @override
  Widget build(BuildContext context) {

    return Container(
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
                      },
                      child: Center(
                          child: Container(
                              width: 43.w,
                              height: 50.h,
                              child: _goal.goalType == GoalType.DRUG?Image.asset("assets/images/mission/drug-mission-icon.png", fit: BoxFit.cover,): _goal.goalType==GoalType.WALK?Image.asset("assets/images/mission/walk-mission-icon.png", fit: BoxFit.cover,):Image.asset("assets/images/mission/common-mission-icon.png", )
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
                                _goal.title,
                                kTextBlackColor
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.w, top: 5.h),
                            child: Body2Text(
                                _goal.description,
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
              child: MissionTimeWidget([GoalTime("20", GoalTimeStatus.NONE,null,null),GoalTime("20", GoalTimeStatus.NONE, null, null)], context)),

        ],
      ),
    );
  }
}
