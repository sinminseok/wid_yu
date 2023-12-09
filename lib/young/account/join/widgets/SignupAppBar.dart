import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/Color.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool canBack;

  SignUpAppBar({required this.canBack});

  @override
  Size get preferredSize => Size.fromHeight(53.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: wWhiteColor,
      elevation: 0,
      automaticallyImplyLeading: false, // 이전 화면으로 자동으로 이동하지 않도록 설정
      leading: PreferredSize(
        preferredSize: Size.fromHeight(40.h), // 아이콘의 높이 설정
        child: Container(
          margin: EdgeInsets.only(top: 20.h,),
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
      ),
    );
  }
}
