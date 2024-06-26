import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/old/health-information/controller/OldHealthInformationController.dart';
import 'package:wid_yu/old/health-information/widgets/HeartBitInformation.dart';
import 'package:wid_yu/old/health-information/widgets/O2Information.dart';
import 'package:wid_yu/old/health-information/widgets/OldCurrentPosition.dart';
import 'package:wid_yu/old/health-information/widgets/OldHealthFloatingButton.dart';
import 'package:wid_yu/old/health-information/widgets/OldNotConnect.dart';
import 'package:wid_yu/old/health-information/widgets/TemperatureInformation.dart';

import '../../common/utils/Color.dart';

class OldHealthInformationView extends StatefulWidget {
  const OldHealthInformationView({Key? key}) : super(key: key);

  @override
  _OldHealthInformationViewState createState() =>
      _OldHealthInformationViewState();
}

class _OldHealthInformationViewState extends State<OldHealthInformationView> {
  OldHealthInformationController controller = OldHealthInformationController();
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    remove();
    super.dispose();
  }

  void remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var object = prefs.get("health");
    if (object == null) {
      prefs.setBool("health", true);
    } else {
      prefs.remove("health");
    }
  }

  Future<bool> loadHealthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var object = prefs.get("health");
    if (object == null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: OldHealthFloatingButton(controller),
      backgroundColor: wYellow100Color,
      body: SingleChildScrollView(
        child: Column(
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
                    //OldNotConnect(),
                    Column(
                      children: [
                        _buildHealthInformation(),
                      ],
                    ),
                    OldCurrentPosition()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHealthInformation() {
    return Column(
      children: [
        O2Information(controller),
        HeartBitInformation(controller),
        TemperatureInformation(controller),
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
                  onTap: () {},
                  child: Image.asset(
                      "assets/common/icon/family-information-icon.png"),
                ),
              )
            ],
          ),
        ));
  }
}
