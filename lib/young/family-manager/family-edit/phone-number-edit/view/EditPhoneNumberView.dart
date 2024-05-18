import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/young/family-manager/family-edit/phone-number-edit/controller/PhoneNumberEditByController.dart';
import 'package:wid_yu/young/family-manager/popup/PhoneNumberChangePopup.dart';
import 'package:wid_yu/young/family-manager/family-edit/phone-number-edit/widgets/NameAndPhoneNumber.dart';

import '../../../../../common/utils/CustomText.dart';
import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/SnackBar.dart';
import '../../old-edit/controller/OldEditController.dart';

class EditPhoneNumberView extends StatefulWidget {

  final pn;


  EditPhoneNumberView(this.pn);

  @override
  _EditPhoneNumberViewState createState() => _EditPhoneNumberViewState();
}

class _EditPhoneNumberViewState extends State<EditPhoneNumberView> {
  PhoneNumberEditByController controller = PhoneNumberEditByController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteColor,
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainText(),
              NameAndPhoneNumber(controller: controller),
            ],
          ),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Obx(() => controller.canChange
        ? Container(
            margin: EdgeInsets.only(bottom: 30.h),
            child: InkWell(
                onTap: () {
                  String pn = controller.phoneNumberController.text;
                  Navigator.pop(context, pn);
                  //PhoneNumberChangePopup().showDialog(context);
                },
                child: OrangeButton("바꾸기")),
          )
        : Container());
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 28.h, left: 20.w),
      child: Title2Text("보호자님의 본인인증을 해주세요.", wGrey800Color),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: wWhiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Image.asset(
                    "assets/images/icon/back-icon.png",
                    width: 11.w,
                    height: 19.h,
                    fit: BoxFit.contain,
                  )),
            ),
            Container(
              child: Title3Text("연락처 변경하기", wGrey800Color),
            ),
            Container()
          ],
        ));
  }
}
