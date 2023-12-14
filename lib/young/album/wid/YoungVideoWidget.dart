

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/album/detail-view/YoungVideoView.dart';

Widget YoungVideoWidget(){
  return InkWell(
    onTap: (){
      //Get.to(() => YoungVideoView("outputVideoPath"));
    },
    child: Container(
      width: 156.w,
      height: 277.h,
      decoration: BoxDecoration(
        color: wGrey200Color,
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: Center(child: Text("서버 연동 후 작업", style: TextStyle(color: wTextBlackColor),),),
    ),
  );
}