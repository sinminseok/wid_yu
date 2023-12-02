import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wid_yu/young/health-infroamtion/controller/YoungHealthInformationController.dart';

import '../../../common/utils/Color.dart';

class HealthFloatingButton extends StatefulWidget {
  final YoungHealthInformationController controller;

  HealthFloatingButton(this.controller);

  @override
  _HealthFloatingButtonState createState() => _HealthFloatingButtonState();
}

class _HealthFloatingButtonState extends State<HealthFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: widget.controller.currentUser.value!.isConnect
                  ? Container()
                  : _buildNotConnectFloating(),
            ),
          ],
        ));
  }

  FloatingActionButton _buildDangerousFloating() {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Container(
          width: 290.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "김옥례 님의 건강수치가 평소와 달라요.",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900),
              ),
              Container(
                width: 36.w,
                height: 36.h,
                decoration:
                    BoxDecoration(color: wWhiteColor, shape: BoxShape.circle),
                child: Icon(
                  Icons.call,
                  color: wErrorColor,
                ),
              )
            ],
          )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      backgroundColor: wErrorColor,
    );
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
