import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/old/family-manager/family-edit/old-edit/widget/OldEditDisease.dart';
import 'package:wid_yu/old/family-manager/family-edit/old-edit/widget/OldEditInformation.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/controller/OldEditController.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/widgets/OldEditDisease.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/widgets/OldEditProfile.dart';
import 'package:wid_yu/young/family-manager/family-edit/phone-number-edit/controller/PhoneNumberEditByController.dart';
import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/FilePath.dart';
import '../../../../../common/utils/SnackBar.dart';
import '../../../../../young/family-manager/popup/ShowFamilyPopup.dart';
import '../controller/OldDiseaseEditByOldController.dart';
import '../controller/OldEditByOldController.dart';

class OldEditByOldView extends StatefulWidget {
  const OldEditByOldView({Key? key}) : super(key: key);

  @override
  _OldEditByOldViewState createState() => _OldEditByOldViewState();
}

class _OldEditByOldViewState extends State<OldEditByOldView> {
  OldEditByOldController controller = OldEditByOldController();
  OldDiseaseEditByOldController _diseaseController = OldDiseaseEditByOldController();
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wOrangeBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //OldEditProfile(widget.),
            _buildUserInformation(),
            _buildFamilyRelationship(),
            OldEditInformation(controller),
            OldEditByOldDisease(_diseaseController),
          ],
        ),
      ),
    );
  }

  Widget _buildDiseaseInformation(){
    return Container(
      width: 335.w,
      height: 280.h,
      margin: EdgeInsets.only(left: 20.w, right:20.w,top: 16.h),
      child: Column(
        children: [

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
          InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     PageTransition(
                //         type: PageTransitionType.fade,
                //         child: (PhoneNumberEditByController())));
              },
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.fade,
                  //         child: (EditPhoneNumberView())));
                },
                child: Container(
                  width: 150.w,

                  child: TextFormField(
                    onChanged: (value) {
                      controller.validateCanSave();
                    },
                    controller: controller.addressController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.right,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3.h),
                      hintText: "주소",
                      hintStyle: TextStyle(
                          color: wGrey300Color,
                          fontSize: 14.sp,
                          fontFamily: "Body1"),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                  // child: Body1Text(
                  //     "${controller.user.brith}",
                  //     kTextBlackColor
                  // ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildBrith() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 0.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("출생연도", wGrey600Color),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         type: PageTransitionType.fade,
              //         child: (EditPhoneNumberView())));
            },
            child: Container(
              width: 90.w,

              child: TextFormField(
                onChanged: (value) {
                  controller.validateCanSave();
                },
                controller: controller.brithController,
                style: TextStyle(color: Colors.black),
                // 텍스트 색상을 검정색으로 설정
                textAlign: TextAlign.right,
                // 텍스트를 왼쪽으로 정렬
                cursorColor: kTextBlackColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3.h),
                  hintText: "1900.00.00",
                  hintStyle: TextStyle(
                      color: wGrey300Color,
                      fontSize: 14.sp,
                      fontFamily: "Body1"),
                  border: InputBorder.none,
                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                ),
              ),
              // child: Body1Text(
              //     "${controller.user.brith}",
              //     kTextBlackColor
              // ),
            ),
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
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         type: PageTransitionType.fade,
              //         child: (EditPhoneNumberView())));
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

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: wOrangeBackGroundColor,
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
            child: Body1Text("부모", wTextBlackColor),
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
