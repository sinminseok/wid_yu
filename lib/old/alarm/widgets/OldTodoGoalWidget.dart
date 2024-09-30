

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/old/alarm/controller/OldAlarmController.dart';
import 'package:wid_yu/old/goal/goal-detail/view/OldGoalDetailView.dart';
import 'package:wid_yu/sql-lite/NoicationDatabase.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';
import '../../../goal-conduct/common-goal-conduct/view/CommonConductView.dart';
import '../../../goal-conduct/drug-goal-conduct/view/DrugConductView.dart';
import '../../../goal-conduct/walk-goal-conduct/view/WalkConductView.dart';
import '../../../sql-lite/Meaasge.dart';

class OldTodoGoalWidget extends StatelessWidget {
  DatabaseHelper databaseHelper;
  GoalResponse? _goal;
  MessageFcm messageFcm;

  OldTodoGoalWidget(this.databaseHelper, this._goal, this.messageFcm);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              InkWell(
                onTap: ()async{
                  await databaseHelper.deleteMessage(messageFcm.id!);
                  if (_goal!.type == "MEDICATION") {
                    Get.to(() => DrugConductView(_goal!, true));
                  } else if (_goal!.type == "WALKING") {
                    Get.to(() => WalkConductView(_goal!, true));
                  } else {
                    Get.to(() => CommonConductView(_goal!, true));
                  }
                },
                child: Container(
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(

                        children: [
                          InkWell(

                            child: Container(
                              margin: EdgeInsets.only(top: 8.h),
                              child: Body2Text("확인하러 가기", wGrey700Color),
                            ),
                          ),
                          Container(
                              width: 14.w,
                              height: 14.h,
                              margin: EdgeInsets.only(top: 8.h,left: 5.w),
                              child: Image.asset("assets/images/icon/next-icon.png")
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
