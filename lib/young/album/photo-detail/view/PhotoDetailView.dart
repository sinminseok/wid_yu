

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';

class PhotoDetailView extends StatelessWidget {
  const PhotoDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true,title: "", color: wWhiteColor,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 376.w,
            height: 244.h,
          child: Image.asset("assets/common/album/family_photo.png",fit: BoxFit.fitWidth,)
          )
        ],
      ),
    );
  }
}
