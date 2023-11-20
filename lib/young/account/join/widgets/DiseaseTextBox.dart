
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiseaseTextBox extends StatelessWidget {
  String title;
  var value;


  DiseaseTextBox(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w,top: 10.h),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.h, color: Colors.grey)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: Text(title, style: TextStyle(color: Colors.black,fontSize: 15.sp),)),
          Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: Text(value, style: TextStyle(color: Colors.black, fontSize: 15.sp),))
        ],
      ),
    );
  }
}
