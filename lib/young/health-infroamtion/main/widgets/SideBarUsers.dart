import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';
import '../../../../old/health-information/dto/OldHealthResponse.dart';
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
    OldHealthResponse user = controller.users[index];
    return InkWell(
      onTap: () {
        controller.pickUser(index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h, left: 0),
        width: 69.w,
        height: 95.h,
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
                          width: 43.w,
                          height: 43.w,

                          decoration: BoxDecoration(
                            color: wWhiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              //todo
                              color: user.state == 1!
                                  ? wErrorColor
                                  : wGrey200Color,
                              width: 3.sp,
                            ),
                          ),
                          child: user.profileImageUrl == null ?Image.asset(
                            "assets/images/user/small-old-man-circle.png",
                          ):ClipOval(
                            child: Image.network(
                              user.profileImageUrl!,
                              fit: BoxFit.fitWidth, // 이미지를 원에 맞게 조정
                              width: 33.w,
                              height: 33.w,
                            ),
                          ),
                        ),
                        // Positioned(
                        //     left:37.w,
                        //     top: 3.h,
                        //     child: Container(
                        //       height: 10.h,
                        //       width: 3.w,
                        //       child: Image.asset(
                        //         "assets/images/icon/red-alarm.png",
                        //         fit: BoxFit.fitHeight,
                        //       ),
                        //     ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 18.h,
                      child: HelperText(
                        "${user.name} ",
                          // "${controller.users[index].name}",
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
