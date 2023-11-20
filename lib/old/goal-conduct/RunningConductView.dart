
import 'package:flutter/material.dart';
import 'package:wid_yu/common/model/mission/Mission.dart';
import 'package:wid_yu/old/goal-conduct/widget/ConductAppbar.dart';

class RunningConductView extends StatefulWidget {
  final Mission mission;


  RunningConductView(this.mission);

  @override
  _RunningConductViewState createState() => _RunningConductViewState();
}

class _RunningConductViewState extends State<RunningConductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConductAppBar(widget.mission.title),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
