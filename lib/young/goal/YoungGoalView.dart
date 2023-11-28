import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/young/goal/controller/YoungGoalController.dart';
import 'package:wid_yu/young/goal/widgets/FloatingButton.dart';
import 'package:wid_yu/young/goal/widgets/HeaderInformation.dart';
import 'package:wid_yu/young/goal/widgets/MyMission.dart';
import 'package:wid_yu/young/goal/widgets/OldMissionWidget.dart';
import 'package:wid_yu/young/goal/widgets/SwitchButton.dart';
import '../../common/common-widget/mission/MissionGroupWidget.dart';
import '../../common/utils/Color.dart';
import '../../common/view/goal/goal-create/GoalCreateView.dart';
import '../../common/view/popup/AlarmOnPopup.dart';
import '../family-manager/FamilyManagerView.dart';
import 'detail-view/ChangeOrderView.dart';
import 'detail-view/YoungGoalDetailView.dart';
import 'detail-view/YoungMessageView.dart';

class YoungGoalView extends StatefulWidget {
  const YoungGoalView({Key? key}) : super(key: key);

  @override
  _YoungGoalViewState createState() => _YoungGoalViewState();
}

class _YoungGoalViewState extends State<YoungGoalView> {
  YoungGoalController controller = YoungGoalController();

  @override
  void initState() {
    controller.checkAlarm(context);
    controller.controllScroll();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.scrollController.dispose();
  }



  // void controllScroll() {
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       // 스크롤이 끝까지 내려갔을 때
  //       setState(() {
  //         _isBottomScroll = true;
  //       });
  //     } else if (_scrollController.position.pixels ==
  //         _scrollController.position.minScrollExtent) {
  //       // 스크롤이 끝까지 올라갔을 때
  //       setState(() {
  //         _isBottomScroll = false;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: YoungGoalFloatinButton(controller: controller,),
      appBar: _buildAppBar(),
      backgroundColor: wPurpleBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: controller.scrollController,
        child: Column(
          children: [
            HeaderInformation(),
            SwitchButton(controller),
            MyMission(controller: controller),
            Obx(() => controller.isBottomScroll.value ? OldMissionWidget() : Container()),
            _buildChangeOrderButton()
          ],
        ),
      ),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: wPurpleBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 47.w,
            height: 30.h,
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            child: Image.asset("assets/common/common/appbar_logo.png"),
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: (YoungMessageView())));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset("assets/common/icon/bell-icon.png"),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: (FamilyManagerView())));
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




  Widget _buildYoungMissions() {
    //사용자의 미션이 없을 경우 EmptyMissionGroupWidget
    //사용자의 미션이 있을 경우 MissionGroupWidget
    return MissionGroupWidget(false);
  }

  Widget _buildChangeOrderButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      width: 140.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: (ChangeOrderView())));
        },
        child: Center(
          child: Text(
            "가족 목록 순서 변경",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextBlackColor,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
