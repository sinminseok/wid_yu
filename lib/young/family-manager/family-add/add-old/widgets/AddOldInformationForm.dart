import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/young/family-manager/family-add/add-old/controller/AddOldController.dart';

import '../../../../../common/text/CustomText.dart';
import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/widgets/TextFormWidget.dart';
import '../../../../account/join/format/PhoneNumberFormat.dart';

class AddOldInformationForm extends StatelessWidget {
  final AddOldController controller;


  AddOldInformationForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 20.h),
        child: Column(
          children: [
            _buildNameForm(),
            _buildBirthForm(),
            _buildPhoneNumberForm(),
            _buildAddressForm(context),
          ],
        ),
      ),
    ));
  }

  Widget _buildNameForm(){
    return Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            child: SubTitle2Text(
                "이름",
                wGrey700Color
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h,left: 10.w),
              child: TextFormField(
                onChanged: (text){
                  controller.updateNextStepState();
                },

                keyboardType: TextInputType.name,
                controller: controller.nameController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "ex)홍길동",
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(fontSize: 13.sp,color: wGrey300Color, fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBirthForm(){
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text("출생연도", wGrey700Color),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h, left: 10.w),
              child: TextFormField(
                onChanged: (text) {
                  controller.updateNextStepState();
                  // 현재 텍스트필드의 텍스트를 출력
                  // controller.validateRightBirthFormat();
                },
                // inputFormatters: [BirthDateInputFormatter()],
                keyboardType: TextInputType.number,
                controller: controller.ageController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "1990.00.00",
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: wGrey300Color,
                      fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          controller.isRightBirthFormat == -1? Container(
            margin: EdgeInsets.only(top: 6.h),
            child: HelperText("올바른 출생 연도 형식이 아닙니다.", wErrorColor),
          ): Container()
        ],
      ),
    ));
  }

  Widget _buildPhoneNumberForm(){
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 0.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SubTitle2Text(
                "연락처",
                wGrey700Color
            ),
          ),
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: wGrey300Color, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h,left: 10.w),
              child: TextFormField(
                onChanged: (text) {
                  // 현재 텍스트필드의 텍스트를 출력
                  controller.validateRightPhoneNumerFormat();
                  controller.updateNextStepState();
                },
                inputFormatters: [PhoneNumberFormatter()],
                keyboardType: TextInputType.number,
                controller: controller.phoneNumberController,
                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  hintText: "010 0000 0000",
                  contentPadding: EdgeInsets.only(top: 5.h),
                  hintStyle: TextStyle(fontSize: 13.sp,color: wGrey300Color, fontFamily: "hint"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
            ),
          ),
          controller.isRightPhoneNumberFormat == -1? Container(
            margin: EdgeInsets.only(top: 6.h),
            child: HelperText("올바른 휴대폰 형식이 아닙니다.", wErrorColor),
          ): Container()
        ],
      ),
    ));
    // return Container(
    //   margin: EdgeInsets.only(top: 8.h),
    //   child: TextFormWidget(
    //       textEditingController: controller.phoneNumberController,
    //       title: '연락처',
    //       formatter: PhoneNumberFormatter(),
    //       hintText: "010 0000 0000",
    //       isIntType: true),
    // );
  }

  Widget _buildAddressForm(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 43.h),
            child: SubTitle2Text(
                "집주소",
                wGrey700Color
            ),
          ),
          Stack(
            children: [
              Container(
                width: 335.w,
                // height: 46.h,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Container(
                    margin: EdgeInsets.only(top: 13.h,left: 10.w),
                    child: controller.addressController != ""?
                    Container(
                      width: 220.w,
                      margin: EdgeInsets.only(right: 55.w, bottom: 13.h),
                      child: Body2Text("${controller.addressController}", wTextBlackColor),
                    ): Container(
                        margin: EdgeInsets.only(bottom: 13.h),
                        child: HintText("도로명 주소찾기", wGrey300Color))
                ),
              ),
              Positioned(
                left: 280.w,
                top: 20.h,
                child: Container(
                  child: InkWell(
                      onTap: ()async{
                        controller.addressAPI(context);
                      },
                      child: Icon(Icons.search, color: wGrey800Color,size: 24.sp,)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
