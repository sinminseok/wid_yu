import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/old/goal/controller/OldGoalController.dart';
import 'package:wid_yu/old/goal/detail-view/OldMessageView.dart';
import 'package:wid_yu/old/goal/widgets/FloatingButton.dart';
import 'package:wid_yu/old/goal/widgets/HeaderInformation.dart';
import 'package:wid_yu/old/goal/widgets/SwitchButton.dart';

import '../../common/common-widget/mission/MissionGroupWidget.dart';
import '../../common/utils/Color.dart';
import '../../common/view/goal/goal-create/GoalCreateView.dart';
import '../../common/view/popup/AlarmOnPopup.dart';
import '../goal-register/GoalRegisterView.dart';
import 'detail-view/OldGoalDetailView.dart';


class OldGoalView extends StatefulWidget {
  const OldGoalView({Key? key}) : super(key: key);

  @override
  _OldGoalView createState() => _OldGoalView();
}

class _OldGoalView extends State<OldGoalView> {
  //bool _switchValue = false;
  OldGoalController controller = OldGoalController();

  //List<Mission> missions = [Mission("미션1", _subtitle, _type)];

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OldGoalFloatingButton(),
      appBar: _buildAppBar(),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HeaderInformation(controller),
            SwitchButton(controller),
            _buildMissions(),
          ],
        ),
      ),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: wOrangeBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){

              // Navigator.push(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.fade,
              //     child: GoalRegisterView(),
              //   ),
              // );
            },
            child: Container(
              width: 47.w,
              height: 30.h,
              margin: EdgeInsets.only(top: 10.h, left: 15.w),
              child: Image.asset("assets/common/common/appbar_logo.png"),
            ),
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: OldMessageView(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset("assets/common/icon/bell-icon.png"),
                  )),
              InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w, top: 10.h),
                    width: 30.w,
                    height: 30.h,
                    child: Image.asset(
                        "assets/common/icon/family-information-icon.png"),
                  )),
            ],
          )
        ],
      ),
    );
  }

 

  Widget _buildMissions() {
    return Container(
        margin: EdgeInsets.only(bottom: 60.h),
        //미션이 없을때 EmptyMissionGroupWidget()
        // 미션이 있을때 MissionGroupWidget()
        child: MissionGroupWidget(true));
  }

}
