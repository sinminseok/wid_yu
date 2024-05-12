import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/young/account/join/old-information/api/OldInformationApi.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';
import 'package:wid_yu/young/account/join/old-information/dto/OldLoginDto.dart';

import '../../../common/utils/Color.dart';
import '../../../dto/old-dto/request/OldGeneratorRequest.dart';
import '../join/controller/YoungJoinTotalController.dart';
import '../join/finish/JoinSuccessView.dart';
import '../join/old-information/view/OtherOldInformationView.dart';

class AccountPopup {
  void showDialog(YoungJoinTotalController controller,BuildContext context, OldGeneratorRequest old) {
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
                    color: wWhiteBackGroundColor,
                    width: 335.w,
                    height: 224.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10.w, top: 13.h),
                                child: Icon(Icons.close, color: wGrey600Color,),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28.h),
                          child: Center(
                            child: Title3Text(
                              "또 다른 부모님의 계정도",
                              wGrey800Color,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: Center(
                            child: Title3Text(
                              "추가로 생성할까요?",
                              wGrey800Color,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 35.h,left: 16.w, right: 16.w),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child:
                                              (OtherOldInformationView(old, controller))));
                                },
                                child: Container(
                                  width: 153.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: wOrange200Color),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: wOrangeColor),
                                  child: Center(
                                    child: ButtonText(
                                      "추가 생성하기", wWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async{
                                  //todo

                                  /**
                                   * 1. 부모님 계정 생성
                                   * 2. 정보 넘기기
                                   */

                                  final SharedPreferences prefs = await SharedPreferences.getInstance();

                                  String? id = await prefs.getString("young_join_id");
                                  String? name =await prefs.getString("young_join_name");
                                  String? phoneNumber =await prefs.getString("young_join_phone_number");

                                  OldLoginDto? createOldAccount =await controller.joinOld(old);

                                  print("object");
                                  print(createOldAccount);

                                  if(createOldAccount == null){
                                    ToastMessage().showtoast("다시 시도해주세요.");
                                  }else{
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: (JoinSuccessView(id!,name!, phoneNumber!,[createOldAccount]))));
                                  }

                                },
                                child: Container(
                                  width: 109.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: wGrey300Color),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: wGrey200Color),
                                  child: Center(
                                    child: ButtonText(
                                      "건너뛰기", wGrey600Color,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        // InkWell(
                        //   onTap: (){
                        //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             GoalView()), (route) => false);
                        //   },
                        //   child: Container(
                        //     margin: EdgeInsets.only(top: 20.h),
                        //     width: 250.w,
                        //     height: 44.h,
                        //     decoration: BoxDecoration(
                        //         color: kPurpleColor,
                        //         borderRadius: BorderRadius.all(Radius.circular(10))
                        //     ),
                        //     child: Center(
                        //       child: Text("목록으로",style: TextStyle(color: kTextWhiteColor),),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
