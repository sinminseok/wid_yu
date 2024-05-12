

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';

class PhotoDetailView extends StatelessWidget {
  YoungRewardReadResponse reward;


  PhotoDetailView(this.reward);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(canBack: true,title: "", color: wPurpleBackGroundColor,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 376.w,
            height: 244.h,
          child: Image.asset("assets/common/album/family_photo.png",fit: BoxFit.fitWidth,)
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h,left: 20.w),
            child: Body2Text(reward.description, kTextBlackColor),
          )
        ],
      ),
    );
  }
}
