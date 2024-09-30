

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/old/alarm/controller/OldAlarmController.dart';
import 'package:wid_yu/old/goal/goal-detail/view/OldGoalDetailView.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';
import 'package:wid_yu/young/goal/goal-detail/view/YoungGoalDetailView.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../../final-dto/young-dto/response/user/YoungMainGoalResponse.dart';
import '../../../../sql-lite/Meaasge.dart';

class YoungSuccessGoalAlarm extends StatelessWidget {
  GoalResponse? _goal;
  MessageFcm messageFcm;
  List<GoalResponse> _goals;
  YoungMainGoalResponse _youngInformation;

  YoungSuccessGoalAlarm(this._goal, this.messageFcm, this._goals, this._youngInformation);

  @override
  Widget build(BuildContext context) {
    return _goal==null?Container():Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
      width: 370.w,
      height: 76.h,
      child: Row(
        children: [
          _buildImage(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 9.w,top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 260.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SubTitle2Text("${messageFcm.title}", wGrey800Color),
                    ),

                  ],
                ),
              ),
              Container(
                width: 300.w,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          child: Body2Text("${messageFcm.body}", wGrey700Color),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(() => YoungGoalDetailView(_youngInformation, _goals));
                          },
                          child: Container(
                              width: 14.w,
                              height: 14.h,
                              margin: EdgeInsets.only(top: 8.h,left: 5.w),
                              child: Image.asset("assets/images/icon/next-icon.png")
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 100.w,
                      child: Body2Text(messageFcm.formatDateTime(), kTextBlackColor),
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }

  Widget _buildImage() {
    return Container(
        margin: EdgeInsets.only(left: 19.w),
        width: 35.w,
        height: 35.h,
        child: _goal!.type == "MEDICATION"
            ? Image.asset(
          "assets/images/icon/alarm/drug-icon.png",
          fit: BoxFit.cover,
        )
            : _goal!.type == "WALKING"
            ? Image.asset(
          "assets/images/icon/alarm/walk-icon.png",
          fit: BoxFit.cover,
        )
            : Image.asset(
          "assets/images/icon/alarm/common-icon.png",
          fit: BoxFit.cover,
        ));
  }
}
