import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/utils/Color.dart';

class AlarmOnPopup {
  void showDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: DefaultTextStyle(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  child: Container(
                    width: 335.w,
                    height: 450.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 16.h, right: 16.w),
                                child: Icon(
                                  Icons.close,
                                  color: wGrey600Color,
                                  size: 16.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "위듀 알림을 켜두세요!",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                    color: kTextBlackColor),
                              ),
                            ),
                            Container(
                              child: Text(
                                "목표를 수행할 시간이 되면 알려드려요.",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextBlackColor),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 221.w,
                          height: 221.h,
                          child: Image.asset(
                              "assets/common/goal/turn-on-alarm.png"),
                        ),
                        InkWell(
                          onTap: () async{
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool("alarmOn", true);
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 15.w, right: 15.w, bottom: 26.h),
                            width: 305.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                color: wPurpleColor,
                                border: Border.all(color: wPurple200Color),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Center(
                              child: Text(
                                "알림키러 가기",
                                style: TextStyle(color: wWhiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
