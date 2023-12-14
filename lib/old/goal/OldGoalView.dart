import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/old/goal/controller/OldGoalController.dart';
import 'package:wid_yu/old/goal/detail-view/OldMessageView.dart';
import 'package:wid_yu/old/goal/widgets/FloatingButton.dart';
import 'package:wid_yu/old/goal/widgets/HeaderInformation.dart';
import 'package:wid_yu/old/goal/widgets/MyMission.dart';
import 'package:wid_yu/old/goal/widgets/SwitchButton.dart';

import '../../common/utils/Color.dart';

class OldGoalView extends StatefulWidget {
  const OldGoalView({Key? key}) : super(key: key);

  @override
  _OldGoalView createState() => _OldGoalView();
}

class _OldGoalView extends State<OldGoalView> {
  OldGoalController controller = OldGoalController();

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
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        floatingActionButton: OldGoalFloatingButton(),
        appBar: _buildAppBar(),
        backgroundColor: wOrangeBackGroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderInformation(controller),
              SwitchButton(controller),
              MyMission(controller),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: wOrangeBackGroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          width: 360.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 47.w,
                height: 21.62.h,
                margin: EdgeInsets.only(top: 10.h, left: 10.w),
                child: Image.asset("assets/common/common/appbar_logo.png"),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8.w, top: 10.h),
                    width: 24.w,
                    height: 24.h,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: OldMessageView(),
                          ),
                        );
                      },

                        child: Image.asset("assets/common/icon/bell-icon.png")),
                  ),
                 Container(
                        margin: EdgeInsets.only(right: 10.w, top: 10.h),
                        width: 30.w,
                        height: 30.h,
                        child: InkWell(
                          onTap: (){

                          },
                          child: Image.asset(
                              "assets/common/icon/family-information-icon.png"),
                        ),
                      )
                ],
              )
            ],
          ),
        ));
  }

// Widget _buildMissions() {
//   return Container(
//       margin: EdgeInsets.only(bottom: 60.h),
//       //미션이 없을때 EmptyMissionGroupWidget()
//       // 미션이 있을때 MissionGroupWidget()
//       child: MissionGroupWidget(true));
// }
}
