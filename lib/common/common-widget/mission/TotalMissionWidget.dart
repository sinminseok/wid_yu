import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/mission-time/TotalMissionWidget.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/view/goal/goal-edit/GoalEditView.dart';
import 'package:wid_yu/young/goal/main/controller/YoungGoalController.dart';

import '../../model/mission/Mission.dart';
import '../../model/mission/MissionTime.dart';
import '../../model/mission/MissionType.dart';
import '../../model/mission/TimeType.dart';
import '../../utils/Color.dart';
import '../mission-time/MissionTimeWidget.dart';

class TotalMissionWidget extends StatelessWidget {
  final Mission _mission;

  TotalMissionWidget(this._mission);

  List<MissionTime> times = [
    MissionTime("12:00", TimeType.DONE),
    MissionTime("13:00", TimeType.NONE),
    MissionTime("14:00", TimeType.YET),
    // MissionTime("15:00", TimeType.YET),
  ];

  List<String> days = [
    "일",
    "토",
    "금",
    "목",
    "수",
    "화",
    "월"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeader(context),
        _buildNextIcon(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return  Container(
      width: 275.w,
      margin: EdgeInsets.only(left: 20.w, top: 15.h),
      decoration: BoxDecoration(color: wWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 4.h),
                      width: 43.w,
                      height: 50.h,
                      child: _mission.missionType==MissionType.DRUG?Image.asset("assets/images/mission/drug-mission-icon.png", fit: BoxFit.cover,): _mission.missionType==MissionType.WALK?Image.asset("assets/images/mission/walk-mission-icon.png", fit: BoxFit.cover,):Image.asset("assets/images/mission/common-mission-icon.png", )
                  )
              ),

              Container(
                margin: EdgeInsets.only(top: 5.h,left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 210.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75.w,
                            margin: EdgeInsets.only(left: 10.w),
                            child: Title3Text(
                                _mission.title,
                                kTextBlackColor
                            ),
                          ),
                          Container(
                              width: 120.w,
                              height: 25.h,
                              child: ListView.builder(
                                  reverse: true,
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
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, top: 5.h),
                      child: Body2Text(
                          _mission.subtitle,
                          wGrey800Color
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15.h, left: 0.w),
                        child: TotalMissionTimeWidget(times, context)),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildNextIcon(){
    return InkWell(
      onTap: (){
        Get.to(() => GoalEditView(), transition: Transition.fadeIn);
      },
      child: Container(
        margin: EdgeInsets.only(right: 15.w),
        width: 11.w,
        height: 11.h,
        child: Image.asset("assets/images/icon/next-icon.png"),
      ),
    );
  }


}
