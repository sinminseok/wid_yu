import 'package:common/utils/Color.dart';
import 'package:common/utils/PopUp.dart';
import 'package:common/utils/exception/InvalidInformationException.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:young/view/goal/popup/SaveFinishPopup.dart';

class GoalCreateView extends StatefulWidget {
  const GoalCreateView({Key? key}) : super(key: key);

  @override
  _GoalCreateViewState createState() => _GoalCreateViewState();
}

class _GoalCreateViewState extends State<GoalCreateView> {
  bool drug = false;
  bool outing = false;
  bool common = false;

  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;

  bool morning = false;
  bool afternoon = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  final String INPUT_TITLE_LENGTH_ERROR = "제목은 10글자가 최대입니다.";
  final String INPUT_CONTENT_LENGTH_ERROR = "내용은 20글자가 최대입니다.";

  void validateTitleLength(){
    if(_titleController.text.length > 10){
      throw InvalidInformationException(INPUT_TITLE_LENGTH_ERROR);
    }
  }

  void validateContetnLength(){
    if(_contentController.text.length > 20){
      throw InvalidInformationException(INPUT_CONTENT_LENGTH_ERROR);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: kTextBlackColor,
            icon: Icon(Icons.close)),
        title: Container(
            margin: EdgeInsets.only(left: 80.w),
            child: Text(
              "목표생성",
              style: TextStyle(color: kTextBlackColor, fontSize: 17.sp),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectMissionType(),
            _buildInputMissionNameAndContent(),
            _buildSelectTerm(),
            Container(
              margin: EdgeInsets.only(left: 25.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "복용 시간",
                      style: TextStyle(color: kTextBlackColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    width: 315.w,
                    height: 245.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 87.w,
                                  height: 92.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.grey)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          morning = true;
                                          afternoon = false;
                                        });
                                      },
                                      child: Container(
                                        width: 87.w,
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: morning != true
                                                ? null
                                                : Border.all(
                                                    color: kPurpleColor)),
                                        child: Center(
                                            child: Text(
                                          "오전",
                                          style: TextStyle(
                                              color: kTextBlackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        )),
                                      ),
                                    ),
                                    Container(
                                      width: 70.w,
                                      height: 1.h,
                                      color: Colors.grey,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          morning = false;
                                          afternoon = true;
                                        });
                                      },
                                      child: Container(
                                        width: 87.w,
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: afternoon != true
                                                ? null
                                                : Border.all(
                                                    color: kPurpleColor)),
                                        child: Center(
                                            child: Text(
                                          "오후",
                                          style: TextStyle(
                                              color: kTextBlackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container()
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      SaveFinishPopup().showDialog(context);
                    },
                    child: Container(
                      width: 315.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: kOrangeColor),
                      child: Center(
                        child: Text("저장하기"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMissionType() {
    return Container(
      margin: EdgeInsets.only(left: 65.w, top: 10.h),
      child: Stack(
        children: [
          Container(
            width: 215.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    drug = true;
                    outing = false;
                    common = false;
                  });
                },
                child: Container(
                  width: 71.5.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color:
                          drug != true ? Colors.transparent : kBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: drug != true
                          ? null
                          : Border.all(width: 2.w, color: kPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: drug != true
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kPurpleColor, // 보라색 테두리 색상
                                  width: 2.0, // 테두리 두께
                                ),
                                color: Colors.transparent,
                              )
                            : BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "약복용",
                            style: TextStyle(
                                fontWeight: drug ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 16.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    drug = false;
                    outing = true;
                    common = false;
                  });
                },
                child: Container(
                  width: 71.5.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: outing != true
                          ? Colors.transparent
                          : kBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: outing != true
                          ? null
                          : Border.all(width: 2.w, color: kPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h),  width: 10.w,
                        height: 10.h,
                        decoration: outing != true
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kPurpleColor, // 보라색 테두리 색상
                                  width: 2.0, // 테두리 두께
                                ),
                                color: Colors.transparent,
                              )
                            : BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "외출",
                            style: TextStyle(
                                fontWeight: outing ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 16.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    drug = false;
                    outing = false;
                    common = true;
                  });
                },
                child: Container(
                  width: 71.5.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: common != true
                          ? Colors.transparent
                          : kBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: common != true
                          ? null
                          : Border.all(width: 2.w, color: kPurpleColor)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: common != true
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kPurpleColor, // 보라색 테두리 색상
                                  width: 1.0, // 테두리 두께
                                ),
                                color: Colors.transparent,
                              )
                            : BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "일반",
                            style: TextStyle(
                                fontWeight: common ? FontWeight.bold : null,
                                color: kTextBlackColor,
                                fontSize: 16.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget _buildInputMissionNameAndContent() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 5.w),
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Text("제목", style: TextStyle(color: kTextBlackColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    width: 320.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(필수) 목표 제목을 입력해주세요. ",
                              fillColor: Colors.black87,
                              // 텍스트 색상을 검정색으로 변경
                            // 텍스트 색상을 검정색으로 변경
                            prefixStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
                            contentPadding: EdgeInsets.only(left: 10.w,bottom: 3.h),
                          ),

                         //maxLength: 10,
                          onChanged: (value) {
                            try {
                              validateTitleLength();
                            } catch (e) {
                              if (e is InvalidInformationException) {
                                //_titleController 마지막 글자 삭제
                                _titleController.text = _titleController.text.substring(0, _titleController.text.length - 1);
                                ToastMessage().showtoast(e.cause);
                              }
                            }

                            setState(() {
                              _titleController;
                            });
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 10.w,
                          child: Text(
                            '${_titleController.text.length}/10',
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
                  margin: EdgeInsets.only(left: 20.w,top: 15.h),
                  child: Text("내용", style: TextStyle(color: kTextBlackColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    width: 320.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: _contentController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(선택) 미션 내용을 입력해주세요. ",
                            fillColor: Colors.black87,
                            // 텍스트 색상을 검정색으로 변경
                            // 텍스트 색상을 검정색으로 변경
                            prefixStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
                            contentPadding: EdgeInsets.only(left: 10.w,bottom: 3.h),
                          ),

                          //maxLength: 10,
                          onChanged: (value) {
                            try {
                              validateContetnLength();
                            } catch (e) {
                              if (e is InvalidInformationException) {
                                //_titleController 마지막 글자 삭제
                                _contentController.text = _contentController.text.substring(0, _contentController.text.length - 1);
                                ToastMessage().showtoast(e.cause);
                              }
                            }
                            setState(() {
                              _contentController;
                            });
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 10.w,
                          child: Text(
                            '${_contentController.text.length}/20',
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

  Widget _buildSelectTerm() {
    return Container(
        margin: EdgeInsets.only(top: 30.h, left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "복용주기",
                style: TextStyle(color: kTextBlackColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        monday = !monday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: monday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("월"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tuesday = !tuesday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: tuesday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("화"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        wednesday = !wednesday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: wednesday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("수"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        thursday = !thursday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: thursday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("목"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        friday = !friday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: friday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("금"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        saturday = !saturday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: saturday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("토"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        sunday = !sunday;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      width: 40.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          color: sunday != true
                              ? Colors.grey.shade400
                              : kOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("일"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
