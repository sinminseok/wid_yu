

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/utils/ConvertPercentage.dart';

import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';

class GoalDetailHeader extends StatelessWidget {
  String _name;
  double _percentage;


  GoalDetailHeader(this._name, this._percentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w,top: 25.h),
                child: Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Title1Text(
                          "${_name} 님,",
                          wGrey800Color
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.h),
                        child: Title1Text(
                            "오늘 ${ConvertPercentage().toPercentage(_percentage)}% 달성!",
                            wGrey800Color
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.only(left: 25.h,top: 12.h),
                child: Title3Text("조금만 더 힘내요!", wGrey500Color),
              )
            ],
          ),
          _buildTrophyImage(),
        ],
      ),
    );
  }


  Widget _buildTrophyImage() {
    return Container(
      margin: EdgeInsets.only(right: 10.w, top: 26.h),
      width: 150.0.w,
      height: 154.0.h,
      child: CircularPercentIndicator(
        backgroundColor: wGrey200Color,
        radius: 60.0.sp,
        lineWidth: 10.0,
        percent: _percentage,
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
