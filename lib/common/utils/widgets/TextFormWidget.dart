import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../Color.dart';

class TextFormWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isIntType;
  final TextInputFormatter? formatter;
  TextEditingController textEditingController = TextEditingController();

  TextFormWidget(
      {required this.title,
        required this.hintText,
      required this.textEditingController,
      required this.isIntType,
        required this.formatter
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            child: SubTitle2Text(
              title,
              wGrey700Color
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h,left: 10.w),
              child: TextFormField(
                inputFormatters: formatter == null?null:[formatter!],
                keyboardType: isIntType?TextInputType.number:TextInputType.name,
                controller: textEditingController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(fontSize: 13.sp,color: wGrey300Color, fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
