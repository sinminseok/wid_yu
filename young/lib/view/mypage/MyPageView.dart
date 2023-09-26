import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/mypage/add/AddUserView.dart';
import 'package:young/view/mypage/widgets/UserWidegt.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: (AddUserView())));
              },
              child: Container(
                child: Text(
                  "추가",
                  style: TextStyle(color: kTextBlackColor, fontSize: 17.sp),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h,left: 10.w),
              child: Text("내 정보", style: TextStyle(fontSize: 17.sp, color: kTextBlackColor, fontWeight: FontWeight.bold),),
            ),
            UserWidget(),
            Container(
              margin: EdgeInsets.only(top: 40.h,left: 10.w),
              child: Text("가족 정보", style: TextStyle(fontSize: 17.sp, color: kTextBlackColor, fontWeight: FontWeight.bold),),
            ),
            UserWidget(),
            UserWidget(),
          ],
        ),
      ),
    );
  }
}
