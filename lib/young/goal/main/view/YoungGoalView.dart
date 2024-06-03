import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/goal/main/controller/YoungGoalController.dart';
import 'package:wid_yu/young/goal/main/widgets/FloatingButton.dart';
import 'package:wid_yu/young/goal/main/widgets/HeaderInformation.dart';
import 'package:wid_yu/young/goal/main/widgets/MyMission.dart';
import 'package:wid_yu/young/goal/main/widgets/OldMissionWidget.dart';
import 'package:wid_yu/young/goal/main/widgets/SwitchButton.dart';
import '../../../../common/common-widget/mission/EmptyGoal.dart';
import '../../../../common/utils/Color.dart';
import '../../../family-manager/family-information/view/FamilyManagerView.dart';
import '../../edit-order/view/ChangeOrderView.dart';
import '../../alarm/view/YoungMessageView.dart';

class YoungGoalView extends StatefulWidget {
  @override
  _YoungGoalViewState createState() => _YoungGoalViewState();
}

class _YoungGoalViewState extends State<YoungGoalView> {
  YoungGoalController controller = YoungGoalController();

  @override
  void initState() {
    controller.checkAlarm(context);
    controller.controllScroll();
    controller.loadInit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //controller.scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: FutureBuilder(future: controller.loadInit(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if (snapshot.hasError){
          return Text("ERROR");
        }else{
          return Scaffold(
            // 부모님이 없을때 endDocked로 변경
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: YoungGoalFloatinButton(
              controller: controller,
            ),
            //YoungGoalFloatinButton(controller: controller,),
            appBar: _buildAppBar(),
            backgroundColor: wPurpleBackGroundColor,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: controller.scrollController,
              child: Column(
                children: [
                  InkWell(
                    onTap: ()async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();

                      var s = await prefs.getString("fcmToken");
                      print(s);
                    },
                    child: Container(
                      child: Body2Text("asdasd", kTextBlackColor),
                    ),
                  ),
                  HeaderInformation(controller),
                  SwitchButton(controller),
                  controller.totalMyGoal.length == 0?EmptyGoal(false): YoungMyMission(
                    controller: controller,
                  ),
                  //OldMissionWidget(controller)
                  // Container(
                  //   child: Text("${controller.totalInformation.seniorsGoalList?[0].name}", style: TextStyle(color: wTextBlackColor),),
                  //
                  // ),
                  Obx(() => controller.isBottomScroll.value
                      ? Container(
                    width: 340.w,
                    child: Column(
                      children: controller.totalInformation.seniorsGoalList!
                          .map((item) {
                        return OldMissionWidget(item);
                      }).toList(),
                    ),
                  )
                      : Container()),

                  Container(
                    height: 120.h,
                  )
                  //_buildChangeOrderButton()
                ],
              ),
            ),
          );
        }
      },)
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
            height: 21.6.h,
            margin: EdgeInsets.only(top: 10.h, left: 0.w),
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
                            child: (FamilyManagerByYoung())));
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

  Widget _buildChangeOrderButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 70.h, top: 20.h),
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
