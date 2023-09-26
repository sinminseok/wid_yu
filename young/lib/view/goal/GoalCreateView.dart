
import 'package:common/utils/Color.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: kTextBlackColor,
            icon: Icon(Icons.close)),
        title: Container(
            margin: EdgeInsets.only(left: 80.w),
            child: Text("목표생성",style: TextStyle(color: kTextBlackColor,fontSize: 17.sp),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 65.w, top: 10.h),
              child: Stack(
                children: [
                  Container(
                    width: 215.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color : Colors.grey)
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
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
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: drug != true ? null:Border.all(color: kPurpleColor)
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                width: 7.w,
                                height: 7.h,
                                decoration: drug != true ?BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kPurpleColor, // 보라색 테두리 색상
                                    width: 2.0, // 테두리 두께
                                  ),
                                  color: Colors.transparent,
                                ):BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPurpleColor
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text("약복용",style: TextStyle(color: kTextBlackColor,fontSize: 16.sp),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
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
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: outing != true ? null:Border.all(color: kPurpleColor)
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                width: 7.w,
                                height: 7.h,
                                decoration: outing != true ?BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kPurpleColor, // 보라색 테두리 색상
                                    width: 2.0, // 테두리 두께
                                  ),
                                  color: Colors.transparent,
                                ):BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPurpleColor
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text("외출",style: TextStyle(color: kTextBlackColor,fontSize: 16.sp),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
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
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: common != true ? null:Border.all(color: kPurpleColor)
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                width: 7.w,
                                height: 7.h,
                                decoration: common != true ?BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kPurpleColor, // 보라색 테두리 색상
                                    width: 2.0, // 테두리 두께
                                  ),
                                  color: Colors.transparent,
                                ):BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPurpleColor
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text("일반",style: TextStyle(color: kTextBlackColor,fontSize: 16.sp),),
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
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h,left: 20.w),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("제목",style:TextStyle(color: kTextBlackColor)),
                        ),
                        Container(
                          width: 320.w,
                          height: 45.h,
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              border: InputBorder.none, // 테두리 제거
                              hintText: "제목", // 힌트 텍스트
                              hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 스타일
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // 내용 여백 조절
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("설명",style:TextStyle(color: kTextBlackColor)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 320.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              border: InputBorder.none, // 테두리 제거
                              hintText: "내용", // 힌트 텍스트
                              hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 스타일
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // 내용 여백 조절
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h,left: 25.w),

              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("복용주기", style: TextStyle(color: kTextBlackColor),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              monday = !monday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: monday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("월"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              tuesday = !tuesday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: tuesday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("화"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              wednesday = !wednesday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: wednesday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("수"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              thursday = !thursday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: thursday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("목"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              friday = !friday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: friday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("금"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              saturday = !saturday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: saturday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("토"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              sunday = !sunday;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 40.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                                color: sunday != true ?Colors.grey.shade400:kOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text("일"),
                            ),
                          ),
                        ),


                      ],

                    ),
                  ),
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 25.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("복용 시간", style: TextStyle(color: kTextBlackColor),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    width: 315.w,
                    height: 245.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
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
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color : Colors.grey)
                                  ),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          morning = true;
                                          afternoon = false;
                                        });
                                      },
                                      child: Container(
                                        width: 87.w,
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            border: morning != true ?null:Border.all(color: kPurpleColor)
                                        ),
                                        child: Center(child: Text("오전", style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 16.sp),)),
                                      ),
                                    ),
                                    Container(width: 70.w,height: 1.h, color: Colors.grey,),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          morning = false;
                                          afternoon = true;
                                        });
                                      },
                                      child: Container(
                                        width: 87.w,
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            border: afternoon != true ?null:Border.all(color: kPurpleColor)
                                        ),
                                        child: Center(child: Text("오후", style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold, fontSize: 16.sp),)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(

                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      SaveFinishPopup().showDialog(context);
                    },
                    child: Container(
                      width: 315.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: kOrangeColor
                      ),
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
}
