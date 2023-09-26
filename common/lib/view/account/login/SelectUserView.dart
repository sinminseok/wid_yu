import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old/view/account/login/LoginView.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/login/LoginView.dart';

import '../../../utils/Color.dart';


class SelectUserView extends StatefulWidget {



  @override
  State<SelectUserView> createState() => _SelectUserView();
}

class _SelectUserView extends State<SelectUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 466.h,
                width: 386.w,
                margin: EdgeInsets.only(top: 53.h,left: 27.w),

                child: Image.asset("assets/images/account/background.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 250.h, left: 114.w),
                width: 275.w,
                height: 270.h,
                child: Image.asset("assets/images/account/background_in.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 175.w, top: 253.h),
                width: 236.w,
                height: 235.h,
                child: Image.asset("assets/images/account/people.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 130.h,left: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 116.w,
                        height: 34.h,
                        child: Image.asset("assets/images/icon/widyu_logo.png")),
                    Container(
                      margin: EdgeInsets.only(top: 10.h, left: 5.w),
                      child: Text(
                        "건강한 습관의 형성\n가족과, 그리고 위듀와 함께해요. ",
                        style: TextStyle(color: kTextBlackColor, fontSize: 25.sp),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 360.w,
                  margin: EdgeInsets.only(top: 490.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: 339.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: (YoungLoginView())));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20.w,top: 5.h),
                                      child: Text("보호자",style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor,fontSize: 20.sp),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20.w,top: 3.h),
                                      child: Text("보호자 로그인 ",style: TextStyle(color: kTextBlackColor),),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: 339.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: (LoginView())));
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20.w,top: 5.h),
                                        child: Text("부모님",style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor,fontSize: 20.sp),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20.w,top: 3.h),
                                        child: Text("부모님 로그인 ",style: TextStyle(color: kTextBlackColor),),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),



        ],
      )),
    );
  }
}
