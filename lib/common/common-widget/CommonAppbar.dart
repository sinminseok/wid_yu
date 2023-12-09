import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool canBack;
  final String? title;
  final Color color;

  CommonAppBar(
      {required this.canBack, required this.title, required this.color});

  @override
  Size get preferredSize => Size.fromHeight(55.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color,
      automaticallyImplyLeading: false,
      title: Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Image.asset("assets/images/icon/back-icon.png",   width: 11.w,
                    height: 19.h,fit: BoxFit.contain,)
              ),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 10.h, right: 43.w),
                    child: Text(
                      title!,
                      style: TextStyle(
                          color: kTextBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ))),
          ],
        ),
      ),
      // leading: Container(
      //     width: 11.w,
      //     height: 19.h,
      //   child: Image.asset("assets/images/icon/back-icon.png",   width: 11.w,
      //     height: 19.h,fit: BoxFit.contain,)
      // ),
    );
  }
}
