
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/old/goal/goal-detail/controller/OldGoalDetailController.dart';

import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';

class GoalDetailHeader extends StatelessWidget {
  OldGoalDetailController controller;
  double percentage;


  GoalDetailHeader(this.controller, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            width: 180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w, bottom: 3.h),
                  child: Title1Text(
                      "오늘은",
                      kTextBlackColor
                  ),
                ),
                Row(
                  children: [
                    Container(
                        height: 39.h,
                        decoration: BoxDecoration(
                            color: wOrangeColor,
                            border: Border.all(color: wOrange200Color),
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(top: 3.h),
                        child: Container(
                          height: 39.h,
                          margin: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Center(
                            child: PercentageText(
                                "${controller.todayPoint.value}P",
                                wWhiteColor
                            ),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 6.w),
                      child: Title1Text(
                          "벌었어요.",
                          kTextBlackColor
                      ),
                    )
                  ],
                ),
                Container(
                  height: 27.h,
                  margin: EdgeInsets.only(left: 5.w, top: 10.h),
                  child: Title3Text(
                      "조금만 더 힘내요!",
                      wGrey500Color
                  ),
                )
              ],
            ),
          ),
          _buildCircularProgress(),
        ],
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: EdgeInsets.only(right: 20.w, top: 10.h),
      width: 150.0.w,
      height: 154.0.h,
      child: CircularPercentIndicator(
        backgroundColor: wGrey200Color,
        radius: 60.0.sp,
        lineWidth: 10.0,
        percent: percentage,
        center: _buildCircularProgressCenter(),
        circularStrokeCap: CircularStrokeCap.round,

        progressColor: wOrangeColor,
      ),
    );
  }

  Widget _buildCircularProgressCenter() {
    return Container(
        height: 120.h,
        width: 120.w,
        decoration: BoxDecoration(
            color: wWhiteColor,
            shape: BoxShape.circle
        ),
        child: Image.asset("assets/common/goal/goal.png"));
  }


}
