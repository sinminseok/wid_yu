
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/button/PurpleButton.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/album/popup/DeleteSuccessPopup.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';


class DeleteRewardPopup {
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
                    height: 415.h,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15.h, left: 15.w),
                                child: Icon(Icons.close, color: wGrey700Color,),
                              ),
                            ),
                            Container()
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          width: 173.w,
                          height: 175.h,
                          child: Image.asset(
                              commonImagePath + "popup/delete_icon.png"),
                        ),
                        Container(
                          child: Title2Text(
                            "삭제할까요?",
                              wTextBlackColor
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: Body1Text(
                            "한번 삭제하면 복구가 안돼요.",
                              wTextBlackColor
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.h),
                          child: Body1Text(
                            "그래도 삭제할까요?",
                              wTextBlackColor
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 40.h),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                DeleteSuccessPopup().showDialog(context);
                              },
                              child: Container(
                                width: 335.w,
                                height: 44.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    color: wErrorColor
                                ),
                                child: Center(child: ButtonText("삭제하기", wWhiteColor)),
                              )),
                        ),

                      ],
                    ),
                  )),
            );
          });
        });
  }
}
