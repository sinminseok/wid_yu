
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Color.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    Key? key,
    required this.title

  }) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 335.w,
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: wOrange200Color),
        color: wOrangeColor,
      ),

      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: wWhiteColor,
            fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}