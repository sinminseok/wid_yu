import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MissionSelectPhoto extends StatefulWidget {
  bool _switchValue;


  MissionSelectPhoto(this._switchValue);

  @override
  _MissionSelectPhotoState createState() => _MissionSelectPhotoState();
}

class _MissionSelectPhotoState extends State<MissionSelectPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Text("약복용 사진찍기", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: wTextBlackColor),),
          ),
          _buildSwitch()
        ],
      ),
    );
  }

  Widget _buildSwitch() {
    return Container(
      margin: EdgeInsets.only(right: 25.w, top: 10.h),
      child: FlutterSwitch(
        width: 60.0.w,
        height: 35.0.h,
        showOnOff: true,
        valueFontSize: 13.sp,
        toggleSize: 20.0,
        value: widget._switchValue,
        onToggle: (value) {
          setState(() {
            widget._switchValue = value;
          });
        },
        activeColor: wTextBlackColor,
        inactiveColor: wOrangeColor,
        toggleColor: Colors.white,
        activeTextColor: kTextWhiteColor,

        inactiveTextColor: kTextWhiteColor,
        activeText: "끔",
        inactiveText: "켬",

      ),
    );
  }
}
