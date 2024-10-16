import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/health-infroamtion/main/controller/YoungHealthInformationController.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/HeartBitInformation.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/O2Information.dart';
import 'package:wid_yu/young/health-infroamtion/main/widgets/TemperatureInformation.dart';

import 'NotConnect.dart';

class HealthInformation extends StatelessWidget {
  final YoungHealthInformationController controller;

  HealthInformation({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.currentUser!.state == 1!
        ? Container(
            margin: EdgeInsets.only(top: 10.h, left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeartBitInformation(controller.currentUser!),
              ],
            ),
          )
        : NotConnect());
  }
}
