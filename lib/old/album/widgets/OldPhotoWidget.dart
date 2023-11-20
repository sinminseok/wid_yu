
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/FilePath.dart';

import '../../../common/utils/Color.dart';

class OldPhotoWidget extends StatefulWidget {
  const OldPhotoWidget({Key? key}) : super(key: key);

  @override
  _OldPhotoWidgetState createState() => _OldPhotoWidgetState();
}

class _OldPhotoWidgetState extends State<OldPhotoWidget> {
  bool isLike = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
        width: 340.w,
        height: 357.h,
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
            _buildHeader(),
            _buildPhoto(),
            _buildPhotoInformation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(){
    return Container(
      margin: EdgeInsets.only(top: 10.h,left: 20.w),
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: wGrey200Color
                  ),
                  child: Image.asset(commonImagePath + "user/youngMan.png"),
                ),
                Container(
                  child: Text("보호자2 님", style: TextStyle(color: wTextBlackColor, fontWeight: FontWeight.w600, fontSize: 16.sp),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            width: 40.w,
            height: 40.h,
            child: Image.asset("assets/common/album/photo_dot.png",),
          ),

        ],
      ),
    );
  }

  Widget _buildPhoto(){
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 335.w,
      height: 210.h,
      child: Image.asset("assets/common/album/family_photo.png"),
    );
  }

  Widget _buildPhotoInformation(){
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 270.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210.w,
            height: 45.h,
            child: Text("오늘 서울숲으로 나들이가기 전에 찍어봤어.다음에 같이 가보자!",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold,fontSize: 16.sp),),

          ),
          InkWell(
            onTap: (){
              setState(() {
                isLike = !isLike;
              });
            },
            child: isLike?Container(
              child: Icon(Icons.favorite, color: wOrangeColor),
            ):Container(
              child: Icon(Icons.favorite_border, color: wGrey600Color),
            )
          )
        ],
      ),
    );
  }
}
