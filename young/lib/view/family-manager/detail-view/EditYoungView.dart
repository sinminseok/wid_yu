

import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditYoungView extends StatefulWidget {
  const EditYoungView({Key? key}) : super(key: key);

  @override
  _EditYoungView createState() => _EditYoungView();
}

class _EditYoungView extends State<EditYoungView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(top: 20.h,right: 10.w),
                child: Text("저장", style: TextStyle(color: kTextGreyColor,fontSize: 16.sp),),
              ),
            )
          ],
        ),
        leading: Container(
          margin: EdgeInsets.only(
            top: 20.h,
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
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
