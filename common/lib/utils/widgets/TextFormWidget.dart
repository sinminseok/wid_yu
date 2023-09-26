import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Color.dart';

class TextFormWidget extends StatefulWidget {
  final String title;
  final bool isIntType;
  TextEditingController textEditingController = TextEditingController();

  TextFormWidget(
      {required this.title,
      required this.textEditingController,
      required this.isIntType});

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
            height: 40.h,
            decoration: BoxDecoration(
                color: kBlankColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.center,
              cursorColor: kTextBlackColor,
              keyboardType:
                  widget.isIntType ? TextInputType.number : TextInputType.name,
              controller: widget.textEditingController,

              decoration: InputDecoration(
                  // contentPadding: EdgeInsets.,
                  hintText: "",
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
