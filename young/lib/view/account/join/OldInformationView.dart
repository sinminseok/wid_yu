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
      appBar: SignUpAppBar(stepNumber: 2),
      body: Container(
        margin: EdgeInsets.only(top: 40.h),
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
              isDisease != null ? InkWell(
                onTap: () {
                  Old old = createSenior(_nameController.text, int.parse(_ageController.text), int.parse(_phoneNumberController.text), _addressController.text, isDisease!);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: (DiseaseView(old: old))));
                },
                child: Container(
                  width: 300.w,
                  height: 50.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Text("다음"),
                  ),
                ),
              ) : Container()
            ],
          ),
        ),
      ),
    );
  }
}
