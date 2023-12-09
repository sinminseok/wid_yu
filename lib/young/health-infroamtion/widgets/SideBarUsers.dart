import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/text/CustomText.dart';

import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../controller/YoungHealthInformationController.dart';

class SideBarUsers extends StatelessWidget {
  final YoungHealthInformationController controller;

  SideBarUsers({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.w,
        height: 400.h,
        margin: EdgeInsets.only(
          top: 10.h,
        ),
        child: ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => _buildUser(index));
            }));
  }

  Widget _buildUser(int index){
    return InkWell(
      onTap: () {
        controller.pickUser(index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h, left: 0),
        width: 69.w,
        height: 75.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          color: controller.currentUser == controller.users[index]
              ? wWhiteColor
              : wPurpleBackGroundColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            border:
            controller.currentUser == controller.users[index]
                ? Border(
              top: BorderSide(color: wGrey100Color),
              bottom: BorderSide(color: wGrey100Color),
              left: BorderSide(color: wGrey100Color),
            )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 3.h),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 6.h),
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: wWhiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: controller
                                  .users[index].isConnect
                                  ? wErrorColor
                                  : wGrey200Color,
                              width: 3.sp,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/user/small-old-man-circle.png",
                          ),
                        ),
                        Positioned(
                            left:37.w,
                            top: 3.h,
                            child: Container(
                              height: 10.h,
                              width: 3.w,
                              child: Image.asset(
                                "assets/images/icon/red-alarm.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 18.h,
                      child: HelperText(
                          "${controller.users[index].name}",
                          wGrey800Color),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
