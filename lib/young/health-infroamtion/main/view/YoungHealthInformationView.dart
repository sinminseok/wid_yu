import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/health-infroamtion/main/controller/YoungHealthInformationController.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/CurrentPosition.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/HealthFloatingButton.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/HealthInformation.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/SideBarUsers.dart';

import '../../../../common/utils/Color.dart';

class YoungHealthInformationView extends StatefulWidget {
  const YoungHealthInformationView({Key? key}) : super(key: key);

  @override
  _YoungHealthInformationView createState() => _YoungHealthInformationView();
}

class _YoungHealthInformationView extends State<YoungHealthInformationView> {
  YoungHealthInformationController controller =
      YoungHealthInformationController();

  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? targetDevice;
  BluetoothCharacteristic? targetCharacteristic;

  @override
  void initState() {
    // TODO: implement initState
    controller.initPickUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HealthFloatingButton(controller),
      backgroundColor: wPurpleBackGroundColor,
      appBar: _buildAppBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideBarUsers(
                  controller: controller,
                ),
                Container(
                    width: 290.w,
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
                        CurrentPosition(controller: controller)
                      ],
                    ))
              ],
            )
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
                        onTap: () {},
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
