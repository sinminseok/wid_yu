
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/album/detail-view/EditPhotoView.dart';
import 'package:wid_yu/young/album/popup/DeleteRewardPopup.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

Widget YoungPhotoWidget(BuildContext context){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
      width: 370.w,
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
          _buildHeader(context),
          _buildPhoto(),
          _buildPhotoInformation(),
        ],
      ),
    ),
  );
}

Widget _buildPhotoInformation(){
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    width: 330.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          width: 210.w,
          height: 45.h,
          child: Text("오늘 서울숲으로 나들이가기 전에 찍어봤어.다음에 같이 가보자!",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold,fontSize: 16.sp),),

         ),

        //안 읽었을때
        // Container(
        //   margin: EdgeInsets.only(right: 7.w),
        //   width: 94.w,
        //   height: 36.h,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(20)),
        //       border: Border.all(color: wGrey500Color)
        //   ),
        //   child: Center(
        //     child: Text("안읽음", style: TextStyle(color: wGrey500Color, fontSize: 18.sp,fontWeight: FontWeight.w600),),
        //   ),
        // ),

        //읽었을때
        Container(
          margin: EdgeInsets.only(right: 7.w),
          width: 94.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: wOrangeColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: wOrange200Color)
          ),
          child: Center(
            child: Text("읽음", style: TextStyle(color: wWhiteColor, fontSize: 18.sp,fontWeight: FontWeight.w600),),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPhoto(){
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 315.w,
    height: 210.h,
    child: Image.asset("assets/common/album/family_photo.png",fit: BoxFit.fitWidth,),
  );
}

Widget _buildHeader(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 10.h,left: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 70.w),
          width: 40.w,
          height: 40.h,
          child: Image.asset("assets/common/album/photo_dot.png",),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.w),
          child: PopupMenuButton<String>(
            icon: Icon(Icons.more_horiz),
            onSelected: (value) {
              // 선택지에 따라 수행할 작업을 추가하세요.
              if (value == 'option1') {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    //AddPhotoView
                    child: EditPhotoView(),
                  ),
                );

              } else if (value == 'option2') {
                DeleteRewardPopup().showDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'option1',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.edit_outlined,size: 16.sp,),
                    Text('수정하기', style: TextStyle(color: wGrey800Color , fontSize: 14.sp),),
                  ],
                )
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delete_outline,size: 16.sp,),
                    Text('삭제하기', style: TextStyle(color: wGrey800Color , fontSize: 14.sp),),
                  ],
                )
              ),
            ],
          ),
        ),
      ],
    ),
  );
}