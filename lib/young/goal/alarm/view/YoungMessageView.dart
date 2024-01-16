import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';
import 'package:wid_yu/young/goal/alarm/widgets/AllReadPhotoAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/AllReadVideoAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/DangerousOldAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/GoalPercentageAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/OldGoalPercentageAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/OldNotSuccessGoalAlarm.dart';

class YoungMessageView extends StatefulWidget {
  const YoungMessageView({Key? key}) : super(key: key);

  @override
  _YoungMessageViewState createState() => _YoungMessageViewState();
}

class _YoungMessageViewState extends State<YoungMessageView> {

  YoungAlarmController controller = YoungAlarmController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '알림',
        color: wWhiteColor,
      ),
      body: SingleChildScrollView(
          child: Container(
        width: 360.w,
        height: 720.h,
        child: Column(
          children: [
            AllReadPhotoAlarm(controller),
            AllReadVideoAlarm(controller),
            DangerousOldAlarm(controller),
            GoalPercentageAlarm(controller),
            OldGoalPercentageAlarm(controller),
            OldNotSuccessGoalAlarm(controller)
          ],
        )
      )),
    );
  }
}
