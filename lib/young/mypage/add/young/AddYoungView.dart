

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/Color.dart';

class AddYoungView extends StatefulWidget {
  const AddYoungView({Key? key}) : super(key: key);

  @override
  _AddYoungViewState createState() => _AddYoungViewState();
}

class _AddYoungViewState extends State<AddYoungView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: wPurpleBackGroundColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 19.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),
                  ),
                  Container(
                    width: 1.w,
                    height: 100.h,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 19.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("추가할 부양자는\n먼저 회원가입을 진행해주세요.",style : TextStyle(color: kTextBlackColor),),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
