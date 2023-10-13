import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Color.dart';

class TextFormWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isIntType;
  final FocusNode? focusNode;
  TextEditingController textEditingController = TextEditingController();

  TextFormWidget(
      {required this.title,
        required this.hintText,
      required this.textEditingController,
      required this.isIntType, this.focusNode,
      });

  @override
  _TextFromWidgetState createState() => _TextFromWidgetState();
}

class _TextFromWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            child: Text(
              widget.title,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: 300.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: kTextGreyColor, width: 0.4),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h,left: 10.w),
              child: TextFormField(
                focusNode: widget.focusNode, // FocusNode 설정
                controller: widget.textEditingController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(fontSize: 13.sp,color: Colors.grey.shade500),
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
