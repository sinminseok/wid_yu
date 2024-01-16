

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/young/goal/goal-create/controller/YoungGoalCreateController.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';

class YoungSelectUser extends StatelessWidget {
  YoungGoalCreateController controller;

  YoungSelectUser(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 26.w,
          left: 14.w,
        ),
        width: 340.w,
        height: 36.h,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.users.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return _buildUser(controller.users[idx], idx);
            }
        )
    );
  }

  Widget _buildUser(OldUser user, int index){
    return Obx(() => controller.selectUser == user ? _buildSelectUser(user): _buildNotSelectUser(user, index));
  }

  Widget _buildSelectUser(OldUser user){
    return Container(
      width: 88.w,
      height: 36.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
          border: Border.all(color: wOrange200Color),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: wOrangeColor
      ),
      child: Center(
        child: Title3Text(user.name!, wWhiteColor),
      ),
    );
  }

  Widget _buildNotSelectUser(OldUser user, int index){
    return Container(
      width: 88.w,
      height: 36.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
          border: Border.all(color: wGrey300Color),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: wWhiteColor
      ),
      child: InkWell(
        onTap: (){
          controller.pickUser(index);
        },
        child: Center(
          child: Title3Text(user.name!, wGrey300Color),
        ),
      ),
    );
  }
}
