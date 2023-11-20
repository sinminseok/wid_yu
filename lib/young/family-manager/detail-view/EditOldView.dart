import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../widgets/DiseaseInformationWidget.dart';
import 'EditPhoneNumberView.dart';

class EditOldView extends StatefulWidget {
  const EditOldView({Key? key}) : super(key: key);

  @override
  _EditOldViewState createState() => _EditOldViewState();
}

class _EditOldViewState extends State<EditOldView> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wPurpleBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfile(),
            _buildUserInformation(),
            _buildFamilyRelationship(),
            _buildUserDetailInformation(),
            _buildDiseases(),
            _buildAddDiseaseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDiseases() {
    return Column(
      children: [
        DiseaseInformationWidget(context),
      ],
    );
  }

  Widget _buildAddDiseaseButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
          color: kTextWhiteColor,
          border: Border.all(
            color: wGrey100Color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w, bottom: 5.h),
              width: 15.h,
              height: 15.w,
              child: Icon(
                Icons.add,
                color: wTextBlackColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Text(
                "질병 추가",
                style: TextStyle(color: wTextBlackColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetailInformation() {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 335.w,
      height: 144.h,
      decoration: BoxDecoration(
        color: kTextWhiteColor,
        border: Border.all(color: wGrey100Color),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          _buildPhoneNumber(),
          Container(
            margin: EdgeInsets.only(top: 11.h),
            width: 308.w,
            height: 0.6.h,
            color: wGrey300Color,
          ),
          Container(
            margin: EdgeInsets.only(top: 13.h),
            width: 310.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "주소",
                    style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "오목로11길 5",
                    style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.h),
            width: 308.w,
            height: 0.5.h,
            color: wGrey300Color,
          ),
          Container(
            margin: EdgeInsets.only(top: 14.h),
            width: 310.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "연락처",
                    style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                  ),
                ),
                Container(
                  child: Text(
                    "010 9174 1765",
                    style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      margin: EdgeInsets.only(top: 13.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "연락처",
              style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: (EditPhoneNumberView())));
            },
            child: Container(
              child: Text(
                "010 9174 1765",
                style: TextStyle(color: kTextBlackColor, fontSize: 14.sp),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: wPurpleBackGroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 20.h, right: 10.w),
              child: Text(
                "저장",
                style: TextStyle(color: kTextGreyColor, fontSize: 16.sp),
              ),
            ),
          )
        ],
      ),
      leading: Container(
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined, // 사용할 아이콘
            color: Colors.black, // 아이콘 색상
          ),
          onPressed: () {
            Navigator.pop(context);
            // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
          },
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Center(
        child: Container(
      margin: EdgeInsets.only(left: 30.w),
      width: 130.w,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: wGrey300Color),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                shape: BoxShape.circle),
            child: Image.asset(commonImagePath + "user/oldManBox.png"),
          ),
          Positioned(
            top: 75.h,
            left: 70.w,
            child: Stack(
              children: [
                Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kTextWhiteColor),
                ),
                Positioned(
                  top: 9.h,
                  left: 9.w,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 19.w,
                      height: 19.h,
                      child:
                          Image.asset(commonImagePath + "icon/camera_icon.png"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildUserInformation() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text(
            "보호자 님",
            style: TextStyle(
                color: wGrey800Color,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text(
            "@ID",
            style: TextStyle(
                color: wGrey600Color,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _buildFamilyRelationship() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          color: kTextWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "가족 관계",
                  style: TextStyle(color: wGrey600Color, fontSize: 14.sp),
                ),
              ),
              _buildSwitch(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 20.w),
            child: Text(
              "아들",
              style: TextStyle(color: wTextBlackColor, fontSize: 16.sp),
            ),
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
        toggleSize: 20.0,
        value: _switchValue,
        onToggle: (value) {
          setState(() {
            _switchValue = value;
          });
        },
        activeColor: wGrey500Color,
        inactiveColor: wOrangeColor,
        toggleColor: Colors.white,
        activeTextColor: kTextWhiteColor,
        inactiveTextColor: kTextWhiteColor,
        activeText: "",
        inactiveText: "",
      ),
    );
  }
}
