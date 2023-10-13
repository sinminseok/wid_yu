import 'package:common/model/mission/Mission.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YoungDrugWidget extends StatelessWidget {
  final Mission _mission;

  YoungDrugWidget(this._mission);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 335.w,
        height: 300.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kLightGreyColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            _buildMissionInfo(),
            _buildDrugMissions(),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w),
      child: Row(
        children: [
          _buildMissionIcon(),
          _buildMissionDetails(),

        ],
      ),
    );
  }

  Widget _buildMissionIcon() {
    return Container(
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
          width: 28.w,
          height: 28.h,
          child: Image.asset("assets/images/icon/mission/drug.png"),
        ),
      ),
    );
  }

  Widget _buildMissionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w),
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
          margin: EdgeInsets.only(left: 20.w, top: 5.h),
          child: Text(
            _mission.subtitle,
            style: TextStyle(
              color: kTextBlackColor,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }



  Widget _buildDrugMissions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    width: 100.w,
                    height: 165.h,
                    decoration: BoxDecoration(
                      color: kLightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kLightGreyColor),
                    ),
                    child: Column(
                      children: [
                        _buildDrugIcon(),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Center(
                            child: Text(
                              "복용 예정",
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _buildTimeText(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    width: 100.w,
                    height: 165.h,
                    decoration: BoxDecoration(
                      color: kLightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kLightGreyColor),
                    ),
                    child: Column(
                      children: [
                        _buildDrugIcon(),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Center(
                            child: Text(
                              "복용 예정",
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _buildTimeText(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    width: 100.w,
                    height: 165.h,
                    decoration: BoxDecoration(
                      color: kLightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kLightGreyColor),
                    ),
                    child: Column(
                      children: [
                        _buildDrugIcon(),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Center(
                            child: Text(
                              "복용 예정",
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _buildTimeText(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    width: 100.w,
                    height: 165.h,
                    decoration: BoxDecoration(
                      color: kLightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kLightGreyColor),
                    ),
                    child: Column(
                      children: [
                        _buildDrugIcon(),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Center(
                            child: Text(
                              "복용 예정",
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _buildTimeText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrugIcon() {
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 58.h),
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 60.h),
            width: 40.w,
            height: 40.h,
            child: Image.asset("assets/images/icon/mission/drug.png"),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeText() {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      width: 80.w,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: kLightGreyColor),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          "17:00",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
