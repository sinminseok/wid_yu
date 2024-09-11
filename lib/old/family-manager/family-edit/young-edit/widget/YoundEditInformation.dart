import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/controller/YoungEditByYoungController.dart';

import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';
import '../controller/YoungEditByOldController.dart';


class YoungEditInformation extends StatelessWidget {
  YoungEditByOldController controller;

  YoungEditInformation(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
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
          _buildAddress(),
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
           //   Get.to(() => EditPhoneNumberView());
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

  Widget _buildAddress() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 14.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("집주소", wGrey600Color),
          ),
          Container(
            child: Body1Text("${controller.user.address}", kTextBlackColor)
          )
        ],
      ),
    );
  }

  Widget _buildBrith() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom:20.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("출생연도", wGrey600Color),
          ),
          Container(
              child: Body1Text("${controller.user.birth}", kTextBlackColor)
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
