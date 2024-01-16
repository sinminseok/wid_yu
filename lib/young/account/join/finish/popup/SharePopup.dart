import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/CustomText.dart';

class SharePopup {
  void showDialog(BuildContext context,String phoneNumber, String code) {
    showGeneralDialog(
        context: context,
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
                  height: 314.h,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h, left: 10.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 16.w,
                                height: 16.h,
                                child: Icon(Icons.close),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        child: Center(
                          child: Title2Text("부모님께 공유해주세요.", wGrey800Color),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        width: 170.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70.h,
                                  width: 70.w,
                                  child: InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                          "assets/images/icon/kakao-message-icon.png")),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 12.h),
                                  child:
                                      SubTitle2Text("카카오톡으로", wTextBlackColor),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4.h),
                                  child: SubTitle2Text("공유하기", wTextBlackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 70.h,
                                  width: 70.w,
                                  child: InkWell(
                                      onTap: () async{
                                        List<String> recipents = [phoneNumber];
                                        String _result = await sendSMS(message: code, recipients: recipents)
                                            .catchError((onError) {
                                          print(onError);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                          "assets/images/icon/message-icon.png")),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 12.h),
                                  child: SubTitle2Text("문자로", wTextBlackColor),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4.h),
                                  child: SubTitle2Text("공유하기", wTextBlackColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

// Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
// builder: (BuildContext context) =>
// YoungGoalView()), (route) => false);
