
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        margin: EdgeInsets.only(top: 10.h),
        child:
        ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  controller.pickUser(index);
                },
                child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 69.w,
                          height: 70.h,
                          child: Column(
                            children: [
                              Obx(() => Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: wWhiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: controller.currentUser== controller.users[index]?wErrorColor:wGrey200Color,width: 3.sp)
                                ),
                                child: Image.asset(commonImagePath + "health-information/old-man.png"),
                              )),
                              Container(
                                child: Text("${controller.users[index].name}", style: TextStyle(color: wGrey800Color,fontWeight: FontWeight.w500 ),),
                              )
                            ],
                          ),
                        ),
                        Container(
                        )
                      ],
                    )),
              );
            }
        )
    );
  }


}
