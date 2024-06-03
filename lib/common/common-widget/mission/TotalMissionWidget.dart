import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/mission-time/TotalMissionWidget.dart';
import 'package:wid_yu/common/dto/goal/Goal.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/goal/goal-edit/view/GoalEditView.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';

import '../../../dto/young-dto/response/goal/GoalResponse.dart';
import '../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../dto/goal/GoalType.dart';
import '../../utils/Color.dart';

class TotalMissionWidget extends StatelessWidget {
  final GoalResponse _goal;
  final bool _isOld;

  TotalMissionWidget(this._isOld, this._goal);


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
    return Container(
      width: 265.w,

      margin: EdgeInsets.only(left: 20.w, top: 15.h),
      decoration: BoxDecoration(color: wWhiteBackGroundColor),
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
                      child: _goal.type == "MEDICATION"
                          ? Image.asset(
                              "assets/images/mission/drug-mission-icon.png",
                              fit: BoxFit.cover,
                            )
                          : _goal.type == "WALKING"
                              ? Image.asset(
                                  "assets/images/mission/walk-mission-icon.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/mission/common-mission-icon.png",
                                ))),
              Container(
                margin: EdgeInsets.only(top: 5.h, left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 205.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70.w,
                            margin: EdgeInsets.only(left: 10.w),
                            child: Title3Text(_goal.title!, kTextBlackColor),
                          ),
                          Container(
                              width: 120.w,
                              height: 25.h,
                              child: ListView.builder(
                                  reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _goal.filterDays().length,
                                  itemBuilder: (BuildContext ctx, int idx) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 3.w),
                                      child: Text(
                                        _goal.filterDays()[idx],
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: wGrey600Color,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  }))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, top: 0.h),
                      child: Body2Text(_goal.description!, wGrey800Color),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15.h, left: 0.w),
                        child: TotalMissionTimeWidget(_goal.times!, context)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNextIcon() {
    return InkWell(
      onTap: () {

        Get.to(() => GoalEditView(_isOld, _goal), transition: Transition.fadeIn);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        width: 11.w,
        height: 11.h,
        child: Image.asset("assets/images/icon/next-icon.png"),
      ),
    );
  }
}
