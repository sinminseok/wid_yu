import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/controller/YoungEditByYoungController.dart';

import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';
import '../../../dto/YoungInformationResponseDto.dart';
import '../../phone-number-edit/view/EditPhoneNumberView.dart';

class YoungEditInformation extends StatelessWidget {
  YoungEditByYoungController controller;
  YoungInformationResponseDto _young;

  YoungEditInformation(this.controller, this._young);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w, bottom: 10.h),
      width: 335.w,
      decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border.all(color: wGrey100Color),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          _buildPhoneNumber(),

          _buildDivider(),
          _buildAddress(context),
          _buildDivider(),
          _buildBrith()
        ],
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 14.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("연락처", wGrey600Color),
          ),
          InkWell(
            onTap: () {
              //Get.to(() => EditPhoneNumberView());
            },
            child: Container(
              child:
                  Body1Text("${controller.user.phoneNumber}", kTextBlackColor),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildAddress(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 14.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("집주소", wGrey600Color),
          ),
          Row(
            children: [
              controller.addressController == ""?Container(
                margin: EdgeInsets.only(right: 5.w),
              child: Body2Text("집주소 검색", wGrey300Color)
          ):Container(
                  width: 150.w,
                  child: Body1Text("${controller.addressController}", wTextBlackColor)
              ),
              InkWell(
                onTap: (){
                  controller.addressAPI(context);
                },
                child: Container(
                  child: Icon(Icons.search),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget _buildBrith() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 20.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("출생연도", wGrey600Color),
          ),
          InkWell(
            onTap: () {
              //Get.to(() => EditPhoneNumberView(), transition: Transition.fade);
            },
            child: Container(
              width: 130.w,

              child: TextFormField(
                keyboardType: TextInputType.number,

                onChanged: (value) {
                  controller.validateCanSave();
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: controller.brithController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.right,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3.h),
                  hintText: "주민번호 앞 6자리",
                  hintStyle: TextStyle(
                      color: wGrey300Color,
                      fontSize: 14.sp,
                      fontFamily: "Body1"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
              // child: Body1Text(
              //     "${controller.user.brith}",
              //     kTextBlackColor
              // ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      width: 308.w,
      height: 1.h,
      color: wGrey300Color,
    );
  }
}
