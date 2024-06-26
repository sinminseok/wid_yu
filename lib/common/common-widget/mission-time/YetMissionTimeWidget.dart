
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../utils/Color.dart';

Widget YetMissionTimeWidget(String? time){
  return Container(
    width: 122.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border.all(color: wGrey500Color),
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: ChipText(
        "${time}",
          wGrey500Color
      ),
    ),
  );

}