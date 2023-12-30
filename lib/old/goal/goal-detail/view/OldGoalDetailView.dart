import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/old/goal/goal-detail/controller/OldGoalDetailController.dart';
import 'package:wid_yu/old/goal/goal-detail/widgets/GoalCalendar.dart';
import 'package:wid_yu/old/goal/goal-detail/widgets/GoalDetailHeader.dart';
import 'package:wid_yu/old/goal/goal-detail/widgets/TodayMissions.dart';

import '../../../../common/utils/Color.dart';

class OldGoalDetailView extends StatefulWidget {
  const OldGoalDetailView({Key? key}) : super(key: key);

  @override
  _GoalDetailView createState() => _GoalDetailView();
}

class _GoalDetailView extends State<OldGoalDetailView> {
  OldGoalDetailController controller = OldGoalDetailController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "부모님 님",color: wOrangeBackGroundColor,),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoalDetailHeader(controller),
            TodayMissions(controller),
            GoalCalendar(controller)
          ],
        ),
      ),
    );
  }
}
