import 'package:common/model/disease/Disease.dart';
import 'package:common/model/user/Old.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/widgets/TextFormWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/join/widgets/SignupAppBar.dart';

import 'DiseaseView.dart';

class OldInformationView extends StatefulWidget {
  const OldInformationView({Key? key}) : super(key: key);

  @override
  _OldInformationView createState() => _OldInformationView();
}

class _OldInformationView extends State<OldInformationView> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _diseaseNameController = TextEditingController();
  TextEditingController _drugNameController = TextEditingController();
  TextEditingController _drugInformationController = TextEditingController();

  TextEditingController _introduceController = TextEditingController();

  bool canAddDisease = true;
  List<Disease> diseases = [];

  void resetController(){
    _diseaseNameController.clear();
    _drugNameController.clear();
    _introduceController.clear();
  }

  bool? isDisease;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Old createSenior(String name, int age, int phoneNumber, String address,
      bool hasDisease) {
    return Old(name, age, phoneNumber, address, hasDisease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(stepNumber: 2, canBack: false,),
      body: Container(
        margin: EdgeInsets.only(top: 25.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 150.w, bottom: 10.h),
                child: Text(
                  "시니어의 정보를 입력해주세요.",
                  style: TextStyle(
                      color: kTextBlackColor, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormWidget(
                textEditingController: _nameController,
                title: '이름',
                isIntType: false,),
              TextFormWidget(
                textEditingController: _ageController,
                title: '나이',
                isIntType: true,),
              TextFormWidget(
                  textEditingController: _phoneNumberController,
                  title: '연락처',
                  isIntType: true),
              TextFormWidget(
                  textEditingController: _addressController,
                  title: '집주소',
                  isIntType: false),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                width: 360.w,
                height: 132.h,
                color: kLightGreyColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.h, left: 20.w),
                      child: Text("보유한 질병이 있나요?",
                        style: TextStyle(color: kTextBlackColor),),
                    ),
                    Container(
                      width: 300.w,
                      margin: EdgeInsets.only(left: 20.w, top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isDisease = true;
                              });
                            },
                            child: Container(
                              width: 136.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                color: isDisease == true
                                    ? kTextBlackColor
                                    : kBlankColor,
                              ),
                              child: Center(child: Text("있음", style: TextStyle(
                                  color: isDisease == true
                                      ? kTextWhiteColor
                                      : kTextBlackColor),)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isDisease = false;
                              });
                            },
                            child: Container(
                              width: 136.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                color: isDisease == false
                                    ? kTextBlackColor
                                    : kBlankColor,
                              ),

                              child: Center(child: Text("없음", style: TextStyle(
                                  color: isDisease == false
                                      ? kTextWhiteColor
                                      : kTextBlackColor),)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              isDisease == true ? Container(
                width: 340.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: TextFormWidget(
                          textEditingController: _diseaseNameController,
                          title: '질병이름(필수)',
                          isIntType: false,
                        )),
                    TextFormWidget(
                      textEditingController: _drugNameController,
                      title: '복용중인 약(선택)',
                      isIntType: false,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0.w, top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "설명(선택)",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            width: 300.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                                color: kBlankColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              // 텍스트 색상을 검정색으로 설정
                              textAlign: TextAlign.center,
                              cursorColor: kTextBlackColor,
                              obscureText: true,
                              controller: _introduceController,

                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(right: 200.w),
                                  hintText: "설명.",
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        var disease = Disease(
                            _diseaseNameController.text,
                            _drugNameController.text,
                            _introduceController.text);
                        diseases.add(disease);
                        setState(() {
                          canAddDisease = !canAddDisease;
                          resetController();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        width: 300.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                            color: kButtonColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "질병 등록",
                            style: TextStyle(color: kTextWhiteColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ) :Container(),
              // InkWell(
              //   onTap: () {
              //     //createSenior(_nameController.text, int.parse(_ageController.text), int.parse(_phoneNumberController.text), _addressController.text, isDisease!);
              //     // Navigator.push(
              //     //     context,
              //     //     PageTransition(
              //     //         type: PageTransitionType.fade,
              //     //         child: (DiseaseView(old: old))));
              //   },
              //   child: Container(
              //     width: 300.w,
              //     height: 50.h,
              //     margin: EdgeInsets.only(top: 10.h),
              //     decoration: BoxDecoration(
              //         color: kButtonColor,
              //         borderRadius: BorderRadius.all(Radius.circular(10))
              //     ),
              //     child: Center(
              //       child: Text("다음"),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
