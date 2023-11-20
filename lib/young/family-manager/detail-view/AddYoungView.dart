import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';

class AddYoungView extends StatefulWidget {
  const AddYoungView({Key? key}) : super(key: key);

  @override
  _AddYoungViewState createState() => _AddYoungViewState();
}

class _AddYoungViewState extends State<AddYoungView> {
  bool isFind = false;
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '보호자 추가',
        color: kTextWhiteColor,
      ),
      body: Column(
        children: [
          isFind ? Container() : _buildMessage(),
          _buildSearchId(),
          isFind ? _buildFindUser() :Container(),
          isFind ? _buildAddButton() :Container(),
        ],
      ),
    );
  }

  Widget _buildAddButton(){
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 335.w,
      height: 44.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: wOrange200Color,
        ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: wOrangeColor
      ),
      child: Center(
        child: Text("추가하기", style: TextStyle(fontSize: 16.sp, color: kTextWhiteColor, fontWeight: FontWeight.bold),),
      ),
    );
  }

  Widget _buildFindUser() {
    return Column(
      children: [
        Container(
          width: 335.w,
          height: 220.h,

          margin: EdgeInsets.only(top: 40.h),
          decoration: BoxDecoration(
              color: kTextWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: wGrey100Color,
              )),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 25.h),
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: wGrey500Color)
                  ),
                  child: Image.asset(commonImagePath + "user/youngMan.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text("보호자 님", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800, color: wTextBlackColor),),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: Text("@1234", style: TextStyle(color: wGrey600Color, fontSize: 14.sp),),
              )
            ],
          )
        )
      ],
    );
  }

  Widget _buildSearchId() {
    return Container(
      width: 315.w,
      height: 46.h,
      margin: EdgeInsets.only(top: 30.h),
      decoration: BoxDecoration(
        border: Border.all(color: wBorderGrey300Color, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _idController,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.left,
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "추가할 아이디 입력",
                  hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            // Add your icon here
            Container(
              child: IconButton(
                icon: Icon(Icons.search),
                // Replace 'your_icon' with the desired icon
                onPressed: () {
                  setState(() {
                    isFind = !isFind;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: wOrangeColor,
                    border: Border.all(color: wOrange200Color)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Text(
                  "추가할 보호자는 회원가입이 되어있어야 해요.",
                  style: TextStyle(color: wGrey800Color, fontSize: 14.sp),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            width: 1.w,
            height: 50.h,
            color: wOrangeColor,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: wOrangeColor,
                    border: Border.all(color: wOrange200Color)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Text(
                  "아이디로 검색하세요.",
                  style: TextStyle(color: wGrey800Color, fontSize: 14.sp),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
