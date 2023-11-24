
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Color.dart';

Widget OrangeButton(String title){
  return Container(
    width: 335.w,
    height: 44.h,
    decoration: BoxDecoration(
        border: Border.all(color: wOrange200Color),
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: wOrangeColor
    ),
    child: Center(child: Text("$title", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,color: wWhiteColor),)),
  );
}