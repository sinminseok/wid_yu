
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/utils/Color.dart';

class YoungHealthInformationView extends StatefulWidget {
  const YoungHealthInformationView({Key? key}) : super(key: key);

  @override
  _YoungHealthInformationView createState() => _YoungHealthInformationView();
}

class _YoungHealthInformationView extends State<YoungHealthInformationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wPurpleBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                _buildOldList(),
                _buildHealthInformation(),
              ],
            )

          ],
        ),
      ),

    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: wPurpleBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 47.w,
            height: 30.h,
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            child: Image.asset("assets/common/common/appbar_logo.png"),
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset("assets/common/icon/bell-icon.png"),
                  )),
              InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w, top: 10.h),
                    width: 30.w,
                    height: 30.h,
                    child: Image.asset(
                        "assets/common/icon/family-information-icon.png"),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOldList() {
    return Container(
      width: 100.w,
      child: Column(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: wGrey200Color
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthInformation(){
    return Column(
      children: [
        _buildO2(),
        _buildHeartBreak(),
        _buildTemperature(),
      ],
    );
  }

  Widget _buildO2() {
    return Container();
  }
  Widget _buildHeartBreak() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("산소포화도", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.bold, fontSize: 14.sp),),
          ),
          Container(
            width: 282.w,
            height: 64.h,
            decoration: BoxDecoration(
              border: Border.all(color: wGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  child: Image.asset("assets/young/health-information/check_list.png"),
                ),
                Column(
                  children: [
                    //체온
                  ],
                ),
                Container(
                  //img
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget _buildTemperature() {
    return Container();
  }

}

