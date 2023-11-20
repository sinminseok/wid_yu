import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/Color.dart';

class MissionSetTimeWidget extends StatefulWidget {
  const MissionSetTimeWidget({Key? key}) : super(key: key);

  @override
  _MissionSetTimeWidgetState createState() => _MissionSetTimeWidgetState();
}

class _MissionSetTimeWidgetState extends State<MissionSetTimeWidget> {

  bool morning = false;
  bool afternoon = false;
  TextEditingController _drugDountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "복용 시간",
              style: TextStyle(
                  color: wGrey700Color,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 335.w,
            height: 245.h,
            decoration: BoxDecoration(
                color: wGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 87.w,
                            height: 92.h,
                            decoration: BoxDecoration(
                                color: kTextWhiteColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: wGrey300Color)),
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
                                  decoration: morning
                                      ? BoxDecoration(
                                      color: wPurpleBackGroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6)),
                                      border:
                                      Border.all(color: wPurpleColor))
                                      : BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(6)),
                                  ),
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
                                  decoration: afternoon
                                      ? BoxDecoration(
                                      color: wPurpleBackGroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6)),
                                      border:
                                      Border.all(color: wPurpleColor))
                                      : BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(6)),
                                  ),
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
                      Row(
                        children: [
                          Container(
                            width: 87.w,
                            height: 92.h,
                            decoration: BoxDecoration(
                                color: kTextWhiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(color: wGrey300Color)),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 40.sp,
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w, right: 5.w),
                            height: 100.h,
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 30.h),
                                    child: Icon(
                                      Icons.circle,
                                      color: wGrey700Color,
                                      size: 13.w,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 5.h),
                                    child: Icon(
                                      Icons.circle,
                                      color: wGrey700Color,
                                      size: 13.w,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 87.w,
                            height: 92.h,
                            decoration: BoxDecoration(
                                color: kTextWhiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(color: wGrey300Color)),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 40.sp,
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300.w,
                  margin: EdgeInsets.only(top: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 13.w),
                        child: Text(
                          "약 개수",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: wGrey700Color,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 197.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                                color: kTextWhiteColor,
                                border: Border.all(color: wGrey300Color),
                                borderRadius:
                                BorderRadius.all(Radius.circular(6))),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _drugDountController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10.h,
                              left: 170.w,
                              child: Text(
                                "개",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: wGrey600Color,
                                    fontSize: 16.sp),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: 318.w,
                  height: 1.h,
                  color: wGrey300Color,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "시간 추가",
                        style: TextStyle(
                            color: wPurpleColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDrugTimeWidget(),
                  _buildDrugTimeWidget(),
                  _buildDrugTimeWidget(),
                  _buildDrugTimeWidget(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrugTimeWidget() {
    return Container(
      width: 125.w,
      height: 36.h,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: wOrangeColor, width: 1.5.w)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text("20:00", style: TextStyle(fontSize: 16.sp, color: wTextBlackColor),),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: Text("3개", style: TextStyle(fontSize: 16.sp, color: wGrey500Color),),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 7.h,left: 3.w),
                width: 15.w,
                height: 15.sp,
                child: Icon(Icons.cancel,color: wOrangeColor,),
              )
            ],
          ),
        ],
      ),);

  }
}
