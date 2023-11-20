
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';


class SecretPhotoWidget extends StatefulWidget {

  SecretPhotoWidget();

  @override
  _SecretPhotoWidgetState createState() => _SecretPhotoWidgetState();
}

class _SecretPhotoWidgetState extends State<SecretPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                Container(
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset("assets/common/album/photo_dot.png",),
                ),
                Container(
                  width: 324.w,
                  height: 210.h,
                  child: Image.asset("assets/common/album/family_photo.png"),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
