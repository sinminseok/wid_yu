import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/mission-time/TotalMissionWidget.dart';
import 'package:wid_yu/common/view/goal/goal-edit/GoalEditView.dart';
import 'package:wid_yu/young/goal/controller/YoungGoalController.dart';

import '../../model/mission/Mission.dart';
import '../../model/mission/MissionTime.dart';
import '../../model/mission/MissionType.dart';
import '../../model/mission/TimeType.dart';
import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class TotalMissionWidget extends StatelessWidget {
  final YoungGoalController controller;
  final Mission _mission;
  final bool isOld;

  TotalMissionWidget(this.controller, this._mission, this.isOld);

  List<MissionTime> times = [
    MissionTime("12:00", TimeType.DONE),
    MissionTime("13:00", TimeType.NONE),
    MissionTime("14:00", TimeType.YET),
    // MissionTime("15:00", TimeType.YET),
  ];

  List<String> days = [
    "월",
    "화",
    "수",
    "목",
    "금",
    "토",
    "일",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                // times의 길이가 하나면 아래 코드를 사용하고 times의 길이가 2개 이상이면 gridview를 사용해 가로에 2열, 세로로 남은 요소들을 배치한다
                Container(
                    margin: EdgeInsets.only(top: 15.h, left: 50.w),
                    child: TotalMissionTimeWidget(times, context)),
              ],
            ),
          ),
          Obx(() =>  controller.canEdit.value?Container(
            child: InkWell(
              onTap: (){
                Get.to(() => GoalEditView(), transition: Transition.fadeIn);
              },
              child: Icon(Icons.arrow_forward_ios_sharp, size: 14.sp, color: wGrey600Color,),
            ),
          ):Container())
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 280.w,
      margin: EdgeInsets.only(left: 20.w, top: 15.h),
      decoration: BoxDecoration(color: wWhiteColor),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                        child: Container(
                            width: 35.w,
                            height: 35.h,
                            child: _mission.missionType == MissionType.DRUG
                                ? Image.asset(
                                    "assets/common/mission/drug-mission.png",
                                    fit: BoxFit.cover,
                                  )
                                : _mission.missionType == MissionType.WALK
                                    ? Image.asset(
                                        "assets/common/mission/walk-mission.png",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/common/mission/common-mission.png",
                                      ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, left: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Text(
                            _mission.title,
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w, top: 5.h),
                          child: Text(
                            _mission.subtitle,
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  width: 130.w,
                  height: 30.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      itemBuilder: (BuildContext ctx, int idx) {
                        return Container(
                          margin: EdgeInsets.only(left: 3.w),
                          child: Text(
                            days[idx],
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: wGrey600Color,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      }))
            ],
          )
        ],
      ),
    );
  }
}
