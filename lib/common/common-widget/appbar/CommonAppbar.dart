import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../utils/Color.dart';

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
      centerTitle: true,
      backgroundColor: color,
      automaticallyImplyLeading: false,
      title: canBack == false?
      Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 0.h, right: 0.w),
                    child: Title3Text(
                        title!,
                        kTextBlackColor
                    ))),
            Container()
          ],
        ),
      )
          :Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                //여기에 코드 구현

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
                    margin: EdgeInsets.only(top: 0.h, right: 0.w),
                    child: Title3Text(
                      title!,
                        kTextBlackColor
                    ))),
            Container()
          ],
        ),
      ),

    );
  }
}
