import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/Color.dart';
import '../../../../utils/PopUp.dart';
import '../../../../utils/exception/InvalidInformationException.dart';

class MissionTextWidget extends StatefulWidget {
  final TextEditingController _titleController;
  final TextEditingController _contentController;


  MissionTextWidget(this._titleController, this._contentController);

  @override
  _MissionTextWidgetState createState() => _MissionTextWidgetState();
}

class _MissionTextWidgetState extends State<MissionTextWidget> {


  final String INPUT_TITLE_LENGTH_ERROR = "제목은 10글자가 최대입니다.";
  final String INPUT_CONTENT_LENGTH_ERROR = "내용은 20글자가 최대입니다.";

  void validateTitleLength() {
    if (widget._titleController.text.length > 10) {
      throw InvalidInformationException(INPUT_TITLE_LENGTH_ERROR);
    }
  }

  void validateContetnLength() {
    if (widget._contentController.text.length > 20) {
      throw InvalidInformationException(INPUT_CONTENT_LENGTH_ERROR);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 5.w),
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Text("제목",
                      style: TextStyle(
                          color: wGrey700Color,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    width: 335.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: widget._titleController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(필수) 목표 제목을 입력해주세요. ",
                            fillColor: Colors.black87,
                            // 텍스트 색상을 검정색으로 변경
                            // 텍스트 색상을 검정색으로 변경
                            prefixStyle: TextStyle(color: Colors.black),
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13.sp),
                            contentPadding:
                            EdgeInsets.only(left: 10.w, bottom: 3.h),
                          ),

                          //maxLength: 10,
                          onChanged: (value) {
                            try {
                              validateTitleLength();
                            } catch (e) {
                              if (e is InvalidInformationException) {
                                //_titleController 마지막 글자 삭제
                                widget._titleController.text = widget._titleController.text
                                    .substring(
                                    0, widget._titleController.text.length - 1);
                                ToastMessage().showtoast(e.cause);
                              }
                            }

                            setState(() {
                              widget._titleController;
                            });
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 10.w,
                          child: Text(
                            '${widget._titleController.text.length}/10',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w, top: 15.h),
                  child: Text("내용",
                      style: TextStyle(
                          color: wGrey700Color,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    width: 335.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: widget._contentController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(선택) 미션 내용을 입력해주세요. ",
                            fillColor: Colors.black87,
                            // 텍스트 색상을 검정색으로 변경
                            // 텍스트 색상을 검정색으로 변경
                            prefixStyle: TextStyle(color: Colors.black),
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13.sp),
                            contentPadding:
                            EdgeInsets.only(left: 10.w, bottom: 3.h),
                          ),

                          //maxLength: 10,
                          onChanged: (value) {
                            try {
                              validateContetnLength();
                            } catch (e) {
                              if (e is InvalidInformationException) {
                                widget._contentController.text =
                                    widget._contentController.text.substring(
                                        0, widget._contentController.text.length - 1);
                                ToastMessage().showtoast(e.cause);
                              }
                            }
                            setState(() {
                              widget._contentController;
                            });
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 10.w,
                          child: Text(
                            '${widget._contentController.text.length}/20',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

