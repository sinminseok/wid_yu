import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/text/CustomText.dart';
import 'package:wid_yu/common/utils/SnackBar.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/controller/YoungEditController.dart';
import 'package:wid_yu/young/family-manager/popup/ShowFamilyPopup.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/widgets/YoungEditProfile.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/FilePath.dart';
import '../../phone-number-edit/view/EditPhoneNumberView.dart';
import '../widgets/YoungEditInformation.dart';

class EditYoungView extends StatefulWidget {
  const EditYoungView({Key? key}) : super(key: key);

  @override
  _EditYoungView createState() => _EditYoungView();
}

class _EditYoungView extends State<EditYoungView> {
  YoungEditController controller = YoungEditController();
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: wPurpleBackGroundColor,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              YoungEditProfile(),
              _buildUserInformation(),
              _buildFamilyRelationship(),
              YoungEditInformation(controller),
            ],
          ),
        ),
      ),
    );
  }





  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: wPurpleBackGroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Image.asset("assets/images/icon/back-icon.png",   width: 11.w,
                    height: 19.h,fit: BoxFit.contain,)
              ),
            ),
            Obx(() => controller.canSave?InkWell(
              onTap: (){
                CustomSnackBar().show(context, "서버 연동 후 구현");
              },
              child: Container(
                margin: EdgeInsets.only(top: 0.h, right: 10.w),
                child: SubTitle2Text("저장", wGrey800Color),
              ),
            ):Container(
              margin: EdgeInsets.only(top: 0.h, right: 10.w),
              child: SubTitle2Text("저장", wGrey500Color),
            ))
          ],
        ));
  }


  Widget _buildUserInformation() {
    return Column(
      children: [
        Container(
          height: 27.h,
          margin: EdgeInsets.only(top: 0.h),
          child: Title3Text("보호자 님", wGrey800Color),
        ),
        Container(
          margin: EdgeInsets.only(top: 2.h),
          height: 27.h,
          child: Body2Text("@ID", wGrey600Color),
        ),
      ],
    );
  }

  Widget _buildFamilyRelationship() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          color: wWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.w),
                child: SubTitle2Text("가족관계 표시", wGrey600Color),
              ),
              _buildSwitch(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 14.w),
            child: Body1Text("아들", wTextBlackColor),
          )
        ],
      ),
    );
  }

  Widget _buildSwitch() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, bottom: 0.h, top: 0.h),
      child: FlutterSwitch(
        width: 64.0.w,
        height: 32.0.h,
        showOnOff: true,
        valueFontSize: 13.sp,
        toggleSize: 30.0,
        value: _switchValue,
        onToggle: (value) {
          print(value);
          if(value == false){
            ShowFamilyPopup().showDialog(context);
          }
          setState(() {
            _switchValue = value;
          });
        },
        activeColor: wGrey500Color,
        inactiveColor: wOrangeColor,
        toggleColor: Colors.white,
        activeTextColor: wWhiteColor,
        inactiveTextColor: wWhiteColor,
        activeText: "",
        inactiveText: "",
      ),
    );
  }
}
