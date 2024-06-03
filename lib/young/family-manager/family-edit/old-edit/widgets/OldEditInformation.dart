import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/controller/OldEditController.dart';
import 'package:wid_yu/young/family-manager/family-edit/phone-number-edit/view/EditPhoneNumberView.dart';
import 'package:flutter/services.dart';
import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';

class OldEditInformation extends StatefulWidget {
  OldEditByYoungController controller;

  OldEditInformation(this.controller);

  @override
  State<OldEditInformation> createState() => _OldEditInformationState();
}

class _OldEditInformationState extends State<OldEditInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
      width: 335.w,
      height: 198.h,
      decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border.all(color: wGrey100Color),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [

          _buildPhoneNumber(context),
          _buildDivider(),
          _buildAddress(context),
          _buildDivider(),
          _buildBrith()
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
              widget.controller.addressController == ""?Container(
                  margin: EdgeInsets.only(right: 5.w),
                  child: Body2Text("집주소 검색", wGrey300Color)
              ):Container(
                  width: 150.w,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Body2Text("${widget.controller.addressController}", wTextBlackColor)
              ),
              InkWell(
                onTap: (){
                  widget.controller.addressAPI(context);
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
    // MaskTextInputFormatter를 사용하여 포맷 지정
    var birthDateFormatter = MaskTextInputFormatter(mask: '##-##-##', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 0.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("출생연도", wGrey600Color),
          ),
          Container(
            width: 90.w,
            child: TextFormField(
              onChanged: (value) {},
              controller: widget.controller.brithController,
              inputFormatters: [birthDateFormatter], // 포맷 적용
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                hintText: "ex)72-09-27",
                hintStyle: TextStyle(
                  color: wGrey300Color,
                  fontSize: 14.sp,
                  fontFamily: "Body1",
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
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

  Widget _buildPhoneNumber(BuildContext context) {
    var phoneNumberFormatter = MaskTextInputFormatter(
      mask: '###########', // Define the format mask as 11 digits
      filter: {"#": RegExp(r'[0-9]')}, // Allow only numeric input
    );

    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 15.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("전화번호", wGrey600Color),
          ),
          Container(
            width: 130.w,
            child: TextFormField(
              onChanged: (value) {},
              controller: widget.controller.phoneNumberController,
              inputFormatters : [
                phoneNumberFormatter,
                LengthLimitingTextInputFormatter(11),
              ],
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                hintText: "ex)01012341234",
                hintStyle: TextStyle(
                  color: wGrey300Color,
                  fontSize: 14.sp,
                  fontFamily: "Body1",
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
