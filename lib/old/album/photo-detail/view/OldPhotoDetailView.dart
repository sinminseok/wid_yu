

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';

class OldPhotoDetailView extends StatelessWidget {
  const OldPhotoDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true,title: "",color: wWhiteColor,),
      backgroundColor: wWhiteColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 153.h),
            width: 376.w,
            height: 250.h,
            child: Image.asset("assets/common/album/family_photo.png", fit: BoxFit.fitWidth,),
          )
        ],
      ),
    );
  }
}
