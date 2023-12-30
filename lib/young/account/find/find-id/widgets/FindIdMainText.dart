

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/find/find-id/controller/FindIdController.dart';

import '../../../../../common/utils/FilePath.dart';

class FindIdMainText extends StatelessWidget {

  FindIdController controller;


  FindIdMainText(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSuccessFind == -1?_buildFaliFindText():_buildCommonText());
  }

  Widget _buildCommonText(){
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h),
            height: 30.h,
            child: Title2Text("아이디 찾기", wGrey800Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            height: 21.h,
            child: Body2Text("아이디를 찾기 위한 정보를 입력해 주세요.", wGrey600Color),
          )
        ],
      ),
    );
  }

  Widget _buildFaliFindText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 98.w,
          height: 90.h,
          child: Image.asset(commonImagePath + "icon/red_alarm_icon.png"),
        ),
        Container(
            height: 30.h,
            margin: EdgeInsets.only(top: 10.h),
            child: Title2Text("등록된 정보와 일치하는 아이디가 없어요.", wGrey800Color)),
        Container(
            height: 21.h,
            margin: EdgeInsets.only(top: 4.h),
            child: Body2Text("혹시 정보를 잘못 입력하지는 않았나요?", wGrey600Color))
      ],
    );
  }
}
