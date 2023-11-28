import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/health-infroamtion/controller/YoungHealthInformationController.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/CurrentPosition.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/HealthInformation.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/SideBarUsers.dart';

import '../../common/model/user/TestHealth.dart';
import '../../common/model/user/TestUser.dart';
import '../../common/utils/Color.dart';

class YoungHealthInformationView extends StatefulWidget {
  const YoungHealthInformationView({Key? key}) : super(key: key);

  @override
  _YoungHealthInformationView createState() => _YoungHealthInformationView();
}

class _YoungHealthInformationView extends State<YoungHealthInformationView> {
  YoungHealthInformationController controller =
      YoungHealthInformationController();

  @override
  void initState() {
    // TODO: implement initState
    controller.initPickUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //  floatingActionButton: _buildExtendButton(),
      backgroundColor: wWhiteBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideBarUsers(
                  controller: controller,
                ),
                Container(
                    width: 290.w,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        border: Border.all(color: wGrey100Color)),
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
        backgroundColor: wWhiteBackGroundColor,
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

  FloatingActionButton _buildExtendButton() {
    return FloatingActionButton.extended(
      onPressed: () {

      },
      label: Container(
        width: 290.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "김옥례 님의 건강수치가 평소와 달라요.",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900),
            ),
            Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: wWhiteColor,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.call, color: wErrorColor,),
            )
          ],
        )
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      backgroundColor: wErrorColor,
    );
  }

}
