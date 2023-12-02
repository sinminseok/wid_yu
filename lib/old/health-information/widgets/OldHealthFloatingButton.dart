import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/old/health-information/controller/OldHealthInformationController.dart';

import '../../../common/utils/Color.dart';

class OldHealthFloatingButton extends StatelessWidget {
  final OldHealthInformationController controller;


  OldHealthFloatingButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: controller.user.value!.isConnect
              ? Container()
              : _buildNotConnectFloating(),
        ),
      ],
    ));
  }


  Widget _buildNotConnectFloating() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 360.w,
        height: 120.h,
        margin: EdgeInsets.only(top: 20.h, bottom: 0.h),
        decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 18.h, left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "스마트워치와 연결이 필요한 페이지입니다.",
                      style: TextStyle(
                          color: wGrey800Color,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text(
                      "연결가능기기  : Google Wear OS를 사용하는 모든 기기",
                      style: TextStyle(
                          color: wGrey600Color,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 23.w),
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.help_outline,
                    color: wGrey800Color,
                    size: 24.sp,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
