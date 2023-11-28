
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../controller/YoungHealthInformationController.dart';

class CurrentPosition extends StatelessWidget {
  YoungHealthInformationController controller;


  CurrentPosition({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Text("위치", style: TextStyle(color: wGrey700Color, fontWeight: FontWeight.w600, fontSize: 14.sp),),
        ),
        Container(
          width: 272.w,
          height: 300.h,
          margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
          decoration: BoxDecoration(
            border: Border.all(color: wGrey200Color),
            borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: Center(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  child: Image.asset(commonImagePath + "icon/location-not-icon.png"),
                ),
                Container(
                  child: Text("부모님의 워치에서 위치 정보를 가져올 수 없어요.", style: TextStyle(color: wGrey500Color, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
