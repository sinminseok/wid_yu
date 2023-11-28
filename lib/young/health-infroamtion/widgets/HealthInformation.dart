import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/health-infroamtion/controller/YoungHealthInformationController.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/HeartBitInformation.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/O2Information.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/TemperatureInformation.dart';

class HealthInformation extends StatelessWidget {
  final YoungHealthInformationController controller;

  HealthInformation({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          O2Information(controller),
          HeartBitInformation(controller),
          TemperatureInformation(controller),
        ],
      ),
    );
  }
}
