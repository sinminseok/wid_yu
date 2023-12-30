import 'package:flutter/material.dart';
import 'package:wid_yu/old/alarm/controller/OldAlarmController.dart';
import 'package:wid_yu/old/alarm/widgets/GoalPercentageAlarm.dart';
import 'package:wid_yu/old/alarm/widgets/OldNotSuccessGoalAlarm.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/utils/Color.dart';

class OldMessageView extends StatefulWidget {
  const OldMessageView({Key? key}) : super(key: key);

  @override
  _OldMessageViewState createState() => _OldMessageViewState();
}

class _OldMessageViewState extends State<OldMessageView> {
  OldAlarmController controller = OldAlarmController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '알림',
        color: wWhiteColor,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              GoalPercentageAlarm(controller),
              OldNotSuccessGoalAlarm(controller)
            ],
          )),
    );
  }
}
