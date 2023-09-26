import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/mypage/add/young/AddYoungView.dart';
import 'package:young/view/mypage/widgets/AddUserWidget.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body: Center(
        child: Container(
          width: 340.w,
          height: 500.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.h),
                child: Icon(
                  Icons.person_add_alt_1,
                  size: 53.sp,
                ),
              ),
              Container(
                child: Text(
                  "가족 구성원 추가하기",
                  style: TextStyle(
                      color: kTextBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 80.h),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: (AddYoungView())));
                      },
                      child: AddUserWidget("보호자 추가", "보호자를 추가해보아요."))),
              InkWell(
                  onTap: () {}, child: AddUserWidget("부모님 추가", "보호자를 추가해보아요.")),
            ],
          ),
        ),
      ),
    );
  }
}
