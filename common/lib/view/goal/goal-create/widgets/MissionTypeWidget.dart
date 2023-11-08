
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/Color.dart';

class MissionTypeWidget extends StatefulWidget {
  bool drug;
  bool outing;
  bool common;


  MissionTypeWidget(this.drug, this.outing, this.common);

  @override
  _MissionTypeWidgetState createState() => _MissionTypeWidgetState();
}

class _MissionTypeWidgetState extends State<MissionTypeWidget> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 67.w, top: 10.h),
      child: Stack(
        children: [
          Container(
            width: 215.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.drug = true;
                    widget.outing = false;
                    widget.common = false;
                  });
                },
                child: Container(
                  width: 71.5.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: widget.drug != true
                          ? Colors.transparent
                          : wPurpleBackGroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: widget.drug != true
                          ? null
                          : Border.all(width: 2.w, color: wPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: widget.drug != true
                            ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: wPurpleColor, // 보라색 테두리 색상
                            width: 1.0, // 테두리 두께
                          ),
                          color: Colors.transparent,
                        )
                            : BoxDecoration(
                            shape: BoxShape.circle, color: wPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "약복용",
                            style: TextStyle(
                                fontWeight: widget.drug ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.drug = false;
                    widget.outing = true;
                    widget.common = false;
                  });
                },
                child: Container(
                  width: 71.5.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: widget.outing != true
                          ? Colors.transparent
                          : wPurpleBackGroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: widget.outing != true
                          ? null
                          : Border.all(width: 2.w, color: wPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: widget.outing != true
                            ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: wPurpleColor, // 보라색 테두리 색상
                            width: 1.0, // 테두리 두께
                          ),
                          color: Colors.transparent,
                        )
                            : BoxDecoration(
                            shape: BoxShape.circle, color: wPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "외출",
                            style: TextStyle(
                                fontWeight: widget.outing ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.drug = false;
                    widget.outing = false;
                    widget.common = true;
                  });
                },
                child: Container(
                  width: 71.5.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: widget.common != true
                          ? Colors.transparent
                          : wPurpleBackGroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: widget.common != true
                          ? null
                          : Border.all(width: 2.w, color: wPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: widget.common != true
                            ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: wPurpleColor, // 보라색 테두리 색상
                            width: 1.0, // 테두리 두께
                          ),
                          color: Colors.transparent,
                        )
                            : BoxDecoration(
                            shape: BoxShape.circle, color: wPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "일반",
                            style: TextStyle(
                                fontWeight: widget.common ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
