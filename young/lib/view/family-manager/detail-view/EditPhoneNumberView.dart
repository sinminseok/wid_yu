import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPhoneNumberView extends StatefulWidget {
  const EditPhoneNumberView({Key? key}) : super(key: key);

  @override
  _EditPhoneNumberViewState createState() => _EditPhoneNumberViewState();
}

class _EditPhoneNumberViewState extends State<EditPhoneNumberView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verifyNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildUserInformation(),
          _buildVerityNumbers(),
        ],
      ),
    );
  }

  Widget _buildVerityNumbers() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50.h),
          child: Text(
            "인증번호",
            style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
          ),
        ),
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
              controller: _verifyNumberController,
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
      ],
    );
  }

  Widget _buildUserInformation() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Text(
              " 보호자님의 본인인증을 해주세요.",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: wTextBlackColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Text(
              "이름",
              style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: wBorderGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // 힌트 텍스트와 입력란 간의 간격 조정
              child: TextFormField(
                controller: _nameController,
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
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              "연락처",
              style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wBorderGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "숫자만 입력",
                      hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 15.h,
                  left: 240.w,
                  child: InkWell(
                    onTap: (){
                      print("dasd");
                    },
                    child: Container(
                child: Text("인증 번호 전송", style: TextStyle(color: wPurpleColor, fontWeight: FontWeight.bold, fontSize: 15.sp),),
              ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kTextWhiteColor,
      title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                  margin: EdgeInsets.only(top: 0.h, right: 43.w),
                  child: Text(
                    "연락처 변경하기",
                    style: TextStyle(
                        color: kTextBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  )),
              InkWell(
                onTap: (){

                },
                child: Container(
                  child: Text("저장", style: TextStyle(color: wGrey500Color, fontSize: 14.sp),),
                ),
              )
            ],
          )),
      leading: Container(
        margin: EdgeInsets.only(
          top: 10.h,
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined, // 사용할 아이콘
            color: Colors.black, // 아이콘 색상
          ),
          onPressed: () {
            Navigator.pop(context);
            // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
          },
        ),
      ),
    );
  }
}
