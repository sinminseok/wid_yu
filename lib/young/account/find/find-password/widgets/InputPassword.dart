

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/account/find/find-password/controller/FindPasswordController.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/CustomText.dart';

class VertifyNumberForm extends StatelessWidget {

  FindPasswordController _controller;


  VertifyNumberForm(this._controller);


  @override
  Widget build(BuildContext context) {
    return _buildVerityNumbers();
  }

  Widget _buildVerityNumbers() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 63.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: SubTitle2Text("인증번호", wGrey700Color)
          ),
          Stack(children: [
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: wBorderGrey300Color, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                // 힌트 텍스트와 입력란 간의 간격 조정
                child: TextFormField(
                  controller: _controller.verifyNumberController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
            Positioned(
                top: 20.h,
                left: 285.w,
                child: InkWell(
                  onTap: () {
                    _controller.successVertify();
                  },
                  child: Container(
                      child: ButtonText("확인", wPurpleColor)
                  ),
                ))
          ])
        ],
      ),
    );
  }
}
