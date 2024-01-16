import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/young/goal/goal-detail/widgets/YoungGoalCalendar.dart';

import '../../../../common/utils/Color.dart';
import '../widgets/GoalDetailHeader.dart';
import '../widgets/TodayMissions.dart';

class YoungGoalDetailView extends StatefulWidget {
  const YoungGoalDetailView({Key? key}) : super(key: key);

  @override
  _GoalDetailView createState() => _GoalDetailView();
}

class _GoalDetailView extends State<YoungGoalDetailView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "보호자님",color: wPurpleBackGroundColor,),
      backgroundColor: wPurpleBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoalDetailHeader(),
            TodayMission(),
            YoungGoalCalendar()
          ],
        ),
      ),
    );
  }
}
