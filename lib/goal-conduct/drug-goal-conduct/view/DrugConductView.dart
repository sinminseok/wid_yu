

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';

import '../../../../common/utils/CustomText.dart';
import '../controller/DrugConductController.dart';
import '../widgets/DrugGoalConductButton.dart';
import '../widgets/GoalConductTimeInformation.dart';

class DrugConductView extends StatelessWidget {

  GoalResponse _goal;


  DrugConductView(this._goal);

  @override
  Widget build(BuildContext context) {

    DrugConductController controller = DrugConductController(_goal);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrugConductInformation(),
              GoalConductTimeInformation(controller),
            ],
          ),
          DrugGoalConductButton(controller),
        ],
      ),
    );
  }

  Widget DrugConductInformation(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 50.h),
            child: LargeTitleText("20:00", wGrey800Color),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: SubTitle2Text("약 개수 : 4개", wGrey800Color),
        )
      ],
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: wWhiteColor,
      automaticallyImplyLeading: false,
      title:Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                //여기에 코드 구현

                Get.to(() => OldFrameView(0), transition: Transition.upToDown);

              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Image.asset("assets/images/icon/back-icon.png",   width: 11.w,
                    height: 19.h,fit: BoxFit.contain,)
              ),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 0.h, right: 20.w),
                    child: Title3Text(
                        "약 이름",
                        kTextBlackColor
                    ))),
            Container()
          ],
        ),
      ),

    );
  }
}
