
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
        width: 375.w,
        height: 357.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: wWhiteColor,
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
      margin: EdgeInsets.only(top: 9.h,left: 21.w),
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
                  margin: EdgeInsets.only(left: 9.w),
                  child: Text("보호자2 님", style: TextStyle(color: wTextBlackColor, fontWeight: FontWeight.w600, fontSize: 16.sp),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25.w),
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
      margin: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
      width: 315.w,
      height: 210.h,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Image.asset("assets/common/album/family_photo.png", fit: BoxFit.fitWidth,)),
    );
  }

  Widget _buildPhotoInformation(){
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 235.w,
            height: 55.h,
            child: Text("오늘 서울숲으로 나들이가기 전에 찍어ddd오늘 서울숲으로 나들이어ddasdasdasddasdasdasdasdasdadasdasdasdasdsadasddd",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.w500,fontSize: 14.sp),),
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
