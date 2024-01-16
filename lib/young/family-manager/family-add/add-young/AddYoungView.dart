import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/young/family-manager/family-add/add-young/AddYoungController.dart';

import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';

class AddYoungView extends StatefulWidget {
  const AddYoungView({Key? key}) : super(key: key);

  @override
  _AddYoungViewState createState() => _AddYoungViewState();
}

class _AddYoungViewState extends State<AddYoungView> {
  AddYoungController controller = AddYoungController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: wWhiteColor,
        appBar: CommonAppBar(
          canBack: true,
          title: "보호자 추가",
          color: wWhiteColor,
        ),
        body: Obx(() => SingleChildScrollView(
          child: Column(
            children: [
              controller.findUsers.length == 0?_buildMainText():Container(),
              _buildFindYoungForm(),
              controller.findUsers.length == 0?Container():_buildFindYoung(),
              controller.findUsers.length == 0?Container():_buildAddButton(),
            ],
          ),
        ))
    );
  }
  
  Widget _buildAddButton(){
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: InkWell(
          onTap: (){
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: OrangeButton("추가하기")),
    );
  }

  Widget _buildFindYoungForm() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
        width: 335.w,
        height: 46.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(
              color: wGrey300Color,
            )),
        child: TextFormField(
          // onChanged: (text) {
          //   // controller.checkCanSelectButton();
          //   // controller.checkReTryId();
          // },

          controller: controller.findIdController,
          style: TextStyle(color: Colors.black),
          // 텍스트 색상을 검정색으로 설정
          textAlign: TextAlign.left,

          // 텍스트를 왼쪽으로 정렬
          cursorColor: kTextBlackColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 8.h, left: 14.w),
            hintText: "추가할 아이디 입력",
            hintStyle: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade500,
                fontFamily: "hint"),
            border: InputBorder.none,
            isDense: true,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 3.w,bottom: 13.h), // 원하는 마진을 설정
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: wGrey800Color,
                  size: 23.sp,
                ),
                // 원하는 아이콘을 사용하도록 변경
                onPressed: () {
                  controller.findYoungUser();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFindYoung() {
    return Container(
      width: 335.w,
      height: 220.h,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 36.h),
      decoration: BoxDecoration(
        color: wWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 27.h),
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              color: wGrey100Color,
              shape: BoxShape.circle,
              border: Border.all(color: wGrey500Color)
            ),
            child: Center(
              child: Image.asset("assets/common/user/youngMan.png"),
            ),
          ),
          Container(
            height: 27.h,
            margin: EdgeInsets.only(top: 16.h),
            child: Title3Text("보호자2 님", wGrey800Color),
          ),
          Container(
            height: 21.h,
            child: Body2Text("@Qhghwk22", wGrey600Color),
          )
        ],
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 50.h, right: 80.w),
      width: 320.w,
      height: 105.h,
      child: InkWell(
          onTap: () {
            print(controller.findUsers);
          },
          child:
              Image.asset("assets/images/common/account/add-family-text.png")),
    );
  }
}
