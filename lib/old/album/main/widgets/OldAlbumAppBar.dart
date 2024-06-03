
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/old/album/main/controller/OldAlbumController.dart';

import '../../../../common/utils/Color.dart';
import '../../like-photo/view/LikePhotoView.dart';

AppBar OldAlbumAppBar(OldAlbumController _controller) {
  return AppBar(
      backgroundColor: wOrangeBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 47.w,
              height: 21.62.h,
              margin: EdgeInsets.only(top: 10.h, left: 10.w),
              child: Image.asset("assets/common/common/appbar_logo.png"),
            ),
            // InkWell(
            //     onTap: () {
            //       Get.to(() => LikePhotoView(_controller));
            //     },
            //     child: Container(
            //         margin: EdgeInsets.only(right: 10.w, top: 10.h),
            //         width: 30.w,
            //         height: 30.h,
            //         child: Icon(Icons.favorite_outline, color: wGrey800Color,)
            //     )),
          ],
        ),
      )
  );
}