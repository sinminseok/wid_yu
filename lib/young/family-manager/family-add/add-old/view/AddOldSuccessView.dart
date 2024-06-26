

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/controller/AddOldController.dart';

import '../../../../account/join/old-information/dto/OldLoginDto.dart';

class AddOldSuccessView extends StatelessWidget {
  OldLoginDto loginDto;


  AddOldSuccessView(this.loginDto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(canBack: false, title: "부모님 추가",color: wWhiteColor,),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMainText(),
                _buildOldInformationCard(),
              ],
            ),

            _buildButton(),
          ],
        ),

    );
  }

  Widget _buildButton(){
    return Container(
      margin: EdgeInsets.only(bottom: 60.h),
      child: InkWell(
          onTap: (){
            Get.back();
            Get.back();
            Get.back();
          },
          child: OrangeButton("확인")),
    );
  }

  Widget _buildOldInformationCard(){
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 36.h),
      width: 335.w,
      height: 110.h,
      decoration: BoxDecoration(
        color: wWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 22.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Title3Text("${loginDto.name}", wPurpleColor),
                ),
                Container(
                  child: Title3Text("님 로그인용 초대 숫자", wGrey800Color),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 9.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title2Text("${loginDto.invitedCode}", wTextBlackColor),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: InkWell(
                      onTap: ()async{
                        Iterable<Contact> contacts = await ContactsService.getContacts();

                        // 특정 문자를 보낼 연락처 선택 (예: 첫 번째 연락처)
                        Contact contact = contacts.first;
                        print(contact);

                        // 문자 보내기
                        //sendSMS(contact.phones.first.value, '안녕하세요, 여기에 내용을 입력하세요!');
                      },
                      child: Icon(Icons.share_outlined, color: wGrey600Color,size: 18.sp,)),
                )
              ],
            )
          )
        ],
      ),
    );
  }


  Widget _buildMainText(){
    return Container(
      margin: EdgeInsets.only(top: 30.h,left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Title2Text("부모님 계정이 생성되어", wGrey800Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Title2Text("가족으로 추가 되었어요.", wGrey800Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.h),
            child: Helper2Text("아래 초대숫자로 부모님 계정에 로그인해 주세요.", wGrey700Color),
          )
        ],
      ),
    );
  }
}
