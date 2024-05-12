import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';

import '../../../../../common/utils/Color.dart';
import '../../controller/YoungJoinTotalController.dart';
import '../controller/YoungJoinController.dart';
import '../widgets/IdPasswordForm.dart';
import '../widgets/SelectButton.dart';

class YoungJoinView extends StatelessWidget {
  YoungJoinTotalController _controller;


  YoungJoinView(this._controller);

  @override
  Widget build(BuildContext context) {

    //YoungJoinController controller = YoungJoinController();

    return WillPopScope(child: Scaffold(
      backgroundColor: wWhiteColor,
      appBar: CommonAppBar(canBack: false, title: "", color: wWhiteColor),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(1),
              _buildHeaderText(),
              IdPasswordForm(_controller),
              //here
              Obx(() {
                return _controller.canSelectButton
                    ? SelectButton(controller: _controller)
                    : SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    ),  onWillPop: ()  {
      return Future(() => false); //뒤로가기 막음
    },);
  }

  Widget _buildHeaderText() {
    return Container(
        height: 60.h,
        margin: EdgeInsets.only(left: 20.w, top: 28.h),
        child: Title2Text("사용하실 아이디와 비밀번호를\n설정해주세요.", wGrey800Color));
  }
}
