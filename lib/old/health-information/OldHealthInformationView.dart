import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/family-manager/family-information/view/OldFamilyManagerView.dart';
import 'package:wid_yu/old/health-information/controller/OldHealthInformationController.dart';
import 'package:wid_yu/old/health-information/widgets/HeartBitInformation.dart';
import 'package:wid_yu/old/health-information/widgets/OldCurrentPosition.dart';
import 'package:wid_yu/old/health-information/widgets/OldNotConnect.dart';

import '../../common/utils/Color.dart';
import '../../young/health-infroamtion/main/widgets/NotConnectMap.dart';
import 'api/OldHealthApi.dart';

class OldHealthInformationView extends StatefulWidget {
  const OldHealthInformationView({Key? key}) : super(key: key);

  @override
  _OldHealthInformationViewState createState() =>
      _OldHealthInformationViewState();
}

class _OldHealthInformationViewState extends State<OldHealthInformationView> {
  OldHealthInformationController controller = OldHealthInformationController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: wYellow100Color,

      body: SingleChildScrollView(
          child: FutureBuilder(
        future: controller.loadInit(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Container();
          } else {
            return Column(
              children: [
                Center(
                  child: Container(
                    width: 341.w,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      color: wWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      children: [
                        // InkWell(
                        //   onTap: ()async{
                        //
                        //
                        //     OldHealthApi().sendHeartBit();
                        //   },
                        //   child: Container(
                        //     child: Body2Text("DASDASd", kTextBlackColor),
                        //   ),
                        // ),
                        controller.healthResponse.state == 0
                            ? OldNotConnect()
                            : Column(
                                children: [
                                  Column(
                                    children: [
                                      _buildHealthInformation(),
                                    ],
                                  ),
                                  controller.healthResponse.latitude == 0.0
                                      ? NotConnectMap()
                                      : InkWell(
                                          onTap: () {
//                                HealthInformationPopup().createGoalPopup(olds, youngs, context);
                                            //OldHealthApi().loadMainPage();
                                          },
                                          child: OldCurrentPosition(
                                              controller.healthResponse))
                                ],
                              )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      )),
    );
  }

  Widget _buildHealthInformation() {
    return Column(
      children: [
        //O2Information(controller),
        HeartBitInformation(controller),
        //TemperatureInformation(controller),
      ],
    );
    //todo

    // return Obx(() => controller.user.value.isConnect!
    //     ? Column(
    //         children: [
    //           O2Information(controller),
    //           HeartBitInformation(controller),
    //           TemperatureInformation(controller),
    //         ],
    //       )
    //     : OldNotConnect());
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
              Container(
                margin: EdgeInsets.only(right: 10.w, top: 10.h),
                width: 30.w,
                height: 30.h,
                child: InkWell(
                  onTap: () {
                    Get.to(() => OldFamilyManagerView());
                  },
                  child: Image.asset(
                      "assets/common/icon/family-information-icon.png"),
                ),
              )
            ],
          ),
        ));
  }
}
