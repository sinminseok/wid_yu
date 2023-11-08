
import 'dart:ui';

import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/PointWidget.dart';
import '../widgets/SecretPhotoWidget.dart';

class AddPhotoView extends StatefulWidget {
  const AddPhotoView({Key? key}) : super(key: key);

  @override
  _AddPhotoViewState createState() => _AddPhotoViewState();
}

class _AddPhotoViewState extends State<AddPhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wOrangeBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '새로운 사진 모으기', color: wOrangeBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCurrentPoint(),
            Container(
              child:BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 15.h, bottom: 10.h),
                  width: 340.w,
                  height: 327.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: kTextWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.18),
                        spreadRadius: 5,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // 모자이크하고자 하는 부분
                      Container(
                        width: 40.w,
                        height: 40.h,
                        child: Image.asset("assets/images/album/photo_dot.png",),
                      ),
                      Container(
                        width: 324.w,
                        height: 210.h,
                        child: Image.asset("assets/images/album/family_photo.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        width: 270.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 210.w,
                              height: 45.h,
                              child: Text(
                                "오늘 서울숲으로 나들이가기 전에 찍어봤어.다음에 같이 가보자!",
                                style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 16.sp),
                              ),
                            ),
                            Container(
                              child: Icon(Icons.favorite, color: wOrangeColor,),
                            )
                          ],
                        ),
                      ),
                      // 여기까지 모자이크하고자 하는 부분
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPoint() {
    return PointWidget();
  }
}
