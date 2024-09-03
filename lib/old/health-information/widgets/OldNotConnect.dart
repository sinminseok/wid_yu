
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/NotConnectMap.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

class OldNotConnect extends StatelessWidget {
  const OldNotConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 12.w),
      child: Column(
        children: [
          _buildO2(),
          NotConnectMap2()
        ],
      ),
    );
  }

  Widget _buildO2(){
    return Container(
      margin: EdgeInsets.only(top: 0.h,left: 3.w, right: 12.w),
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("산소포화도", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 315.w,
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
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("심박수", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 315.w,
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
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("체온", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
          ),
          Container(
            width: 315.w,
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


  Widget NotConnectMap2(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Text("위치", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
        ),
        Container(
          width: 315.w,
          height: 300.h,
          margin: EdgeInsets.only(top: 10.h, bottom: 140.h),
          decoration: BoxDecoration(
              border: Border.all(color: wGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: Center(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  child: Image.asset(commonImagePath + "icon/location-not-icon.png"),
                ),
                Container(
                  child: Text("위치 정보를 가져올 수 없어요.", style: TextStyle(color: wGrey500Color, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
