
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/Color.dart';

class ConductAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String missionName;


  ConductAppBar(this.missionName);

  @override
  Size get preferredSize => Size.fromHeight(55.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kTextWhiteColor,
      title: Center(child: Container(
          margin: EdgeInsets.only(top: 10.h,right: 43.w),
          child: Text(missionName,style: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold,fontSize: 18.sp),))),
      leading: Container(
        margin: EdgeInsets.only(
          top: 10.h,
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined, // 사용할 아이콘
            color: Colors.black, // 아이콘 색상
          ),
          onPressed: () {
            Navigator.pop(context);
            // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
          },
        ),
      ),
    );
  }
}
