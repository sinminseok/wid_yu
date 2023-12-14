
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../utils/Color.dart';

Widget PurpleButton(String title){
  return Container(
    width: 335.w,
    height: 44.h,
    decoration: BoxDecoration(
        border: Border.all(color: wPurple200Color),
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: wPurpleColor
    ),
    child: Center(child: ButtonText("$title", wWhiteColor)),
  );
}