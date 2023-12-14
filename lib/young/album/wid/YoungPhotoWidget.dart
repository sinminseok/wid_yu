
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/young/album/detail-view/EditPhotoView.dart';
import 'package:wid_yu/young/album/popup/DeleteRewardPopup.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

Widget YoungPhotoWidget(BuildContext context){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
      width: 370.w,
      height: 350.h,
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
    margin: EdgeInsets.only(top: 14.h),
    width: 330.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          width: 210.w,
          height: 45.h,
          child: Text("오늘 서울숲으로 나들이가기 전에 찍어봤어.다음에 같이 가보자!",overflow: TextOverflow.ellipsis,maxLines:2,style: TextStyle(fontFamily: "Body2",color: kTextBlackColor, fontWeight: FontWeight.w500,fontSize: 14.sp),),

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
        //     child: Title3Text("안읽음", style: TextStyle(color: wGrey500Color, fontSize: 18.sp,fontWeight: FontWeight.w600),),
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
            child: Title3Text("읽음", wWhiteColor),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPhoto(){
  return Container(
    margin: EdgeInsets.only(top: 10.h,left: 20.w, right: 20.w),
    width: 346.w,
    height: 210.h,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Image.asset("assets/common/album/family_photo.png",fit: BoxFit.fitWidth,)),
  );
}

Widget _buildHeader(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 10.h,left: 15.w),
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
                margin: EdgeInsets.only(left: 5.w),
                child: SubTitle2Text("보호자2 님",wTextBlackColor),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(right: 10.w),
          child: PopupMenuButton<String>(
            icon: Icon(Icons.more_horiz, color: wGrey600Color,),
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
                    Container(
                      width: 16.w,
                      height: 16.h,
                      child: Image.asset("assets/images/icon/pencil-icon.png"),
                    ),
                    Helper2Text('수정하기', wGrey800Color),
                  ],
                )
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      child: Image.asset("assets/images/icon/delete-icon.png"),
                    ),
                    Helper2Text('삭제하기', wGrey800Color),
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