
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/album/photo-detail/view/OldPhotoDetailView.dart';

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
      margin: EdgeInsets.only(top: 13.h,left: 21.w),
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: wGrey200Color
                  ),
                  child: Image.asset(commonImagePath + "user/youngMan.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 9.w),
                  child: SubTitle2Text("이승철 님", wTextBlackColor),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildPhoto(){
    return InkWell(
      onTap: (){
        Get.to(() => OldPhotoDetailView());
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.h,left: 20.w,right: 20.w),
        width: 335.w,
        height: 210.h,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            child: Image.asset("assets/common/album/family_photo.png", fit: BoxFit.fitWidth,)),
      ),
    );
  }

  Widget _buildPhotoInformation(){
    return Container(
      margin: EdgeInsets.only(top: 15.h,bottom: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 235.w,
            height: 55.h,

            child: Text("오늘 사진관에서 찍은 사진이야!",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,

              style: TextStyle(height: 1.8.h,fontFamily: "body2",color: kTextBlackColor, fontWeight: FontWeight.w500,fontSize: 14.sp),),
          ),
          InkWell(
            onTap: (){
              setState(() {
                isLike = !isLike;
              });
            },
            child: isLike?Container(
              child: Icon(Icons.favorite, color: wOrange200Color),
            ):Container(
              child: Icon(Icons.favorite_border, color: wOrange200Color),
            )
          )
        ],
      ),
    );
  }
}
