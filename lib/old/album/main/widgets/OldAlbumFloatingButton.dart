
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/album/collect-new-photo/view/CollectPhotoView.dart';

import '../../../../common/utils/Color.dart';

Container OldAlbumFloatingButton() {
  return Container(
    margin: EdgeInsets.only(right: 0.w),
    child: ConstrainedBox(

      constraints: BoxConstraints.tightFor(width: 185, height: 44),
      child:  FloatingActionButton(

        onPressed: () {
          Get.to(() => CollectPhotoView(), transition: Transition.fadeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(Icons.add,size: 17.sp,),
            ),
            Container(
              margin: EdgeInsets.only(right: 0.w),
              child: ButtonText(
                  " 새로운 사진 모으기",
                  wWhiteColor
              ),
            ),
          ],
        ),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        foregroundColor: Colors.white,
        backgroundColor: wPurpleColor,
      ),
    ),
  );
}


// return FloatingActionButton.extended(
// onPressed: () {
// Get.to(() => CollectPhotoView());
// },
// label: Container(
// child: ButtonText(
// "새로운 사진 모으기",
// wWhiteColor
// ),
// ),
// icon: const Icon(
// Icons.add,
// size: 20,
// ),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
// foregroundColor: Colors.white,
// backgroundColor: wPurpleColor,
// );
