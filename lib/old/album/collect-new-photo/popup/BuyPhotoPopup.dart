

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import 'package:wid_yu/old/album/main/api/OldAlbumApi.dart';

import '../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import 'BuyPhotoFinishPopup.dart';


class BuyPhotoPopup {
  void showDialog(BuildContext context, YoungRewardReadResponse reward, int currentPoint) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Container(
                width: 345.w,
                height: 328.h,
                decoration: BoxDecoration(
                    color: wWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(6))),

                child: Column(

                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 18.h,left: 18.w),
                          child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close, color: wGrey700Color,)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14.h),
                      child: Title2Text("새로운 소식을 구매할까요?", wTextBlackColor),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 27.w,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: wOrange200Color),
                                        color: wOrangeColor,
                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                    ),
                                    child: Center(
                                      child: PercentageText("${reward.point}p", wWhiteColor),
                                    ),
                                  ),
                                  Container(
                                    child: SubTitle1Text(" 을 차감해요", wGrey600Color),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.h),
                                child: SubTitle2Text("구매 후 잔여 포인트", wGrey600Color),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                child: PercentageText("${currentPoint - reward.point!}p", wGrey800Color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 14.h),
                          width: 129.w,
                          height: 136.h,
                          child: Image.asset("assets/images/old/reward/reward-photo.png"),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 21.h),
                      child: InkWell(
                          onTap: ()async{
                            bool response = await OldAlbumApi().buyReward(reward.rewardIdx!);

                            if(response) {
                              Navigator.pop(context);
                              BuyPhotoFinishPopup().showDialog(context);
                            }else{
                              Navigator.pop(context);

                            }


                          },
                          child: OrangeButton("구매하기")),
                    )


                  ],
                ),
              ),
            );
          });
        });
  }
}