import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/utils/Color.dart';
import '../controller/VertifyPhoneController.dart';

class NameAndPhoneNumber extends StatelessWidget {
  final VerificationPhoneController controller;

  NameAndPhoneNumber({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h, left: 20.w),
            child: Text(
              "이름",
              style: TextStyle(
                  color: wGrey700Color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
              border: Border.all(color: wBorderGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // 힌트 텍스트와 입력란 간의 간격 조정
              child: TextFormField(
                controller: controller.nameController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "예) 홍길동",
                  hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 20.w),
            child: Text(
              "연락처",
              style: TextStyle(
                  color: wGrey700Color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  width: 335.w,
                  height: 46.h,
                  margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: wBorderGrey300Color, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    // 힌트 텍스트와 입력란 간의 간격 조정
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.phoneNumberController,
                      style: TextStyle(color: Colors.black),
                      // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.left,
                      // 텍스트를 왼쪽으로 정렬
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "숫자만 입력",
                        hintStyle:
                            TextStyle(color: wGrey300Color, fontSize: 14.sp),
                        border: InputBorder.none,
                        isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  InkWell(
                    onTap: () {
                      print("dasd");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20.h, right: 30.w),
                      child: Text(
                        "인증 번호 전송",
                        style: TextStyle(
                            color: wPurpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ),
                  )
                ],
              )
              // Positioned(
              //     top: 15.h,
              //     left: 225.w,
              //     child: InkWell(
              //       onTap: () {
              //         print("dasd");
              //       },
              //       child: Container(
              //         child: Text(
              //           "인증 번호 전송",
              //           style: TextStyle(
              //               color: wPurpleColor,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15.sp),
              //         ),
              //       ),
              //     ))
            ],
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                  child: Text(
                    "인증번호",
                    style: TextStyle(
                        color: wGrey700Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 335.w,
                      height: 46.h,
                      margin:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: wBorderGrey300Color, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        // 힌트 텍스트와 입력란 간의 간격 조정
                        child: TextFormField(
                          controller: controller.verifyNumberController,
                          style: TextStyle(color: Colors.black),
                          // 텍스트 색상을 검정색으로 설정
                          textAlign: TextAlign.left,
                          // 텍스트를 왼쪽으로 정렬
                          cursorColor: kTextBlackColor,
                          decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                                color: wGrey300Color, fontSize: 14.sp),
                            border: InputBorder.none,
                            isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 18.h,
                        left: 290.w,
                        child: InkWell(
                          onTap: () {
                            print("dasd");
                          },
                          child: Container(
                            child: Text(
                              "확인",
                              style: TextStyle(
                                  color: wPurpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
