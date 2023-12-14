

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/PurpleButton.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/view/EditYoungView.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

class PhoneNumberChangePopup {
  void showDialog( BuildContext context) {
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
                    height: 289.h,
                    child: Column(
                      children: [
                        Container(
                          width: 143.w,
                          height: 145.h,
                          margin: EdgeInsets.only(top: 18.h),
                          child: Image.asset("assets/common/popup/save_goal.png"),
                        ),
                        Container(
                          child: Center(
                            child: Title2Text("연락처 변경완료!", wTextBlackColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 30.h),
                          child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                                Navigator.pop(context);

                                //Get.to(() => EditYoungView());

                              },
                              child: PurpleButton("확인")),
                        )
                      ],
                    ),
                  )
              ),
            );
          });
        });
  }
}

// Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
// builder: (BuildContext context) =>
// YoungGoalView()), (route) => false);