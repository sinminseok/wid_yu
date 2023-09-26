
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
      width: 310.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kButtonColor,
      ),

      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: kTextWhiteColor,
            fontSize: 18
        ),
      ),
    );
  }
}