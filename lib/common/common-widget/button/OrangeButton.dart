
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../utils/Color.dart';

Widget OrangeButton(String title){
  return Container(
    margin: EdgeInsets.only(
      left: 20.w,
      right: 20.w
    ),
    width: 335.w,
    height: 44.h,
    decoration: BoxDecoration(
        border: Border.all(color: wOrange200Color),
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: wOrangeColor
    ),
    child: Center(child: ButtonText("${title}", wWhiteColor),)
  );
}