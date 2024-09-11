import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/family-manager/family-information/view/FamilyManagerView.dart';
import 'package:wid_yu/young/health-infroamtion/api/YoungHealthApi.dart';
import 'package:wid_yu/young/health-infroamtion/main/controller/YoungHealthInformationController.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/CurrentPosition.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/HealthFloatingButton.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/HealthInformation.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/NotConnect.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/NotConnectMap.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/SideBarUsers.dart';

import '../../../../common/utils/Color.dart';

class YoungHealthInformationView extends StatefulWidget {
  const YoungHealthInformationView({Key? key}) : super(key: key);

  @override
  _YoungHealthInformationView createState() => _YoungHealthInformationView();
}

class _YoungHealthInformationView extends State<YoungHealthInformationView> {
  @override
  Widget build(BuildContext context) {
    YoungHealthInformationController controller =
        YoungHealthInformationController();

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HealthFloatingButton(controller),
        backgroundColor: wPurpleBackGroundColor,
        appBar: _buildAppBar(),
        body: FutureBuilder(
          future: controller.loadInit(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // InkWell(
                        //   onTap: (){
                        //     print(controller.currentUser!.state == 0);
                        //   },
                        //   child: Container(
                        //     child: Body2Text("${controller.currentUser?.state}", kTextBlackColor),
                        //   ),
                        // ),
                        SideBarUsers(
                          controller: controller,
                        ),
                        Container(
                            width: 290.w,
                            height: 730.h,
                            margin: EdgeInsets.only(top: 10.h),
                            decoration: BoxDecoration(
                                color: wWhiteColor,
                                border: Border(
                                  top: BorderSide(color: wGrey100Color),
                                  bottom: BorderSide(color: wGrey100Color),
                                )),
                            child: Column(
                              children: [
                                HealthInformation(controller: controller),
                                controller.currentUser?.state == 0
                                    ? NotConnectMap()
                                    : CurrentPosition(controller: controller),
                                // InkWell(
                                //     onTap: ()async{
                                //       YoungHealthApi().loadDetailInformation(controller.currentUser!.userIdx!);
                                //       //var list = await YoungHealthApi().loadMainPage();
                                //       //print(list!.length);
                                //     },
                                //     child: CurrentPosition(controller: controller))
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: wPurpleBackGroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          children: [
            Row(
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
                          Get.to(() => FamilyManagerByYoung());
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
          ],
        ));
  }
}
