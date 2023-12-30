
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';
import '../../../../common/utils/constants/HealthInformation.dart';

class NotConnect extends StatelessWidget {
  const NotConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 12.w),
      child: Column(
        children: [
          _buildO2(),
          _buildHeartBit(),
          _buildTemperature()
        ],
      ),
    );
  }

  Widget _buildO2(){
    return Container(
      margin: EdgeInsets.only(top: 0.h,left: 3.w, right: 12.w),
      width: 275.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("산소포화도", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 282.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: wWhiteBackGroundColor,
                border: Border.all(color: wGrey200Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    margin: EdgeInsets.only(left: 9.w),
                    child: Image.asset(commonImagePath + "health-information/grey/grey-02.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h,left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("-", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey500Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2.h, left: 2.w),
                              child: Text("%", style: TextStyle(color: wGrey500Color, fontWeight: FontWeight.w600, ),),
                            )
                          ],
                        ),
                        Container(
                          child: Text("-", style: TextStyle(color: wGrey500Color),),
                        )

                      ],
                    ),
                  ),
                ],),
                Container(
                  margin: EdgeInsets.only(right: 13.w),
                  width: 80.w,
                  height: 44.h,
                  child: Image.asset(commonImagePath + "health-information/grey/grey-graph.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeartBit(){
    return Container(
      margin: EdgeInsets.only(top: 10.h,left: 3.w, right: 12.w),
      width: 275.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("심박수", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 282.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: wWhiteBackGroundColor,
                border: Border.all(color: wGrey200Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    margin: EdgeInsets.only(left: 9.w),
                    child: Image.asset(commonImagePath + "health-information/grey/grey-heart.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h,left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("-", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey500Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2.h, left: 2.w),
                              child: Text("%", style: TextStyle(color: wGrey500Color, fontWeight: FontWeight.w600, ),),
                            )
                          ],
                        ),
                        Container(
                          child: Text("-", style: TextStyle(color: wGrey500Color),),
                        )

                      ],
                    ),
                  ),
                ],),
                Container(
                  margin: EdgeInsets.only(right: 13.w),
                  width: 80.w,
                  height: 44.h,
                  child: Image.asset(commonImagePath + "health-information/grey/grey-bar.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTemperature(){
    return Container(
      margin: EdgeInsets.only(top: 10.h,left: 3.w, right: 12.w),
      width: 275.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("체온", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 282.w,
            height: 64.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: wWhiteBackGroundColor,
                border: Border.all(color: wGrey200Color),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    margin: EdgeInsets.only(left: 9.w),
                    child: Image.asset(commonImagePath + "health-information/grey/grey-temperature.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h,left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("-", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: wGrey500Color),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2.h, left: 2.w),
                              child: Text("%", style: TextStyle(color: wGrey500Color, fontWeight: FontWeight.w600, ),),
                            )
                          ],
                        ),
                        Container(
                          child: Text("-", style: TextStyle(color: wGrey500Color),),
                        )

                      ],
                    ),
                  ),
                ],),
                Container(
                  margin: EdgeInsets.only(right: 13.w),
                  width: 80.w,
                  height: 44.h,
                  child: Image.asset(commonImagePath + "health-information/grey/grey-graph.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
