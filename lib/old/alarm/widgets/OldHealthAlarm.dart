import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/old/alarm/controller/OldAlarmController.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/old/goal/goal-detail/view/OldGoalDetailView.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../sql-lite/Meaasge.dart';
import '../../../sql-lite/NoicationDatabase.dart';

class OldHealthAlarm extends StatelessWidget {
  bool isOld;
  DatabaseHelper databaseHelper;
  MessageFcm messageFcm;

  OldHealthAlarm(this.isOld, this.databaseHelper, this.messageFcm);

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

  Widget _buildContent() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 9.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 260.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child:
                          SubTitle2Text("${messageFcm.title}", wGrey800Color),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          child: Body2Text("확인하러 가기", wGrey700Color),
                        ),
                        InkWell(
                          onTap: () {
                            databaseHelper.deleteMessage(messageFcm.id!);
                            if (isOld) {
                              Get.to(() => OldFrameView(2));
                            } else {
                              Get.to(() => YoungFrameView(2));
                            }
                            //Get.to(() => OldGoalDetailView());
                          },
                          child: Container(
                              width: 14.w,
                              height: 14.h,
                              margin: EdgeInsets.only(top: 8.h, left: 5.w),
                              child: Image.asset(
                                  "assets/images/icon/next-icon.png")),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 100.w,
                      child: Body2Text(
                          messageFcm.formatDateTime(), kTextBlackColor),
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
      width: 30.w,
      height: 30.h,
      child: Image.asset(
        "assets/common/health-information/heart-icon.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
