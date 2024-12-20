
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import 'package:wid_yu/young/album/edit-photo/view/EditPhotoView.dart';
import 'package:wid_yu/young/album/photo-detail/view/PhotoDetailView.dart';
import 'package:wid_yu/young/album/popup/DeleteRewardPopup.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';



class YoungPhotoWidget extends StatelessWidget {
  YoungRewardReadResponse rewardReadResponse;


  YoungPhotoWidget(this.rewardReadResponse);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
        width: 370.w,
        height: 370.h,
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
            child: Text(rewardReadResponse.description!,overflow: TextOverflow.ellipsis,maxLines:2,style: TextStyle(fontFamily: "Body2",color: kTextBlackColor, fontWeight: FontWeight.w500,fontSize: 14.sp),),

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
          rewardReadResponse.status == 1? Container(
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
          ):       Container(
            margin: EdgeInsets.only(right: 7.w),
            width: 94.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: wGrey200Color,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: wGrey300Color)
            ),
            child: Center(
              child: Title3Text("안읽음", wWhiteBackGroundColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoto(){
    return InkWell(
      onTap: (){
        Get.to(() => PhotoDetailView(rewardReadResponse));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h,left: 20.w, right: 20.w),
        width: 346.w,
        height: 210.h,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Image.network(rewardReadResponse.url!,fit: BoxFit.fitWidth,)),
      ),
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
                  margin: EdgeInsets.only(top: 0.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: wGrey100Color),
                    shape: BoxShape.circle,
                    color: wWhiteColor,
                  ),
                  height: 33.h,
                  width: 33.h, // 원형을 만들기 위해 width와 height를 동일하게 설정
                  clipBehavior: Clip.hardEdge, // 내용이 Container의 경계를 넘지 않도록 설정
                  child: rewardReadResponse.uploaderImageUrl == null
                      ? Image.asset(
                    "assets/common/user/youngMan.png",
                    fit: BoxFit.cover, // 이미지를 Container에 맞게 조정
                  )
                      : ClipOval(
                    child: Image.network(
                      rewardReadResponse.uploaderImageUrl!,
                      fit: BoxFit.cover, // 이미지를 원에 맞게 조정
                      width: 33.h,
                      height: 33.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: SubTitle2Text("${rewardReadResponse.uploaderName} 님",wTextBlackColor),
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
                      child: EditPhotoView(rewardReadResponse),
                    ),
                  );

                } else if (value == 'option2') {
                  DeleteRewardPopup().showDialog(context, rewardReadResponse.rewardIdx!);
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

}

