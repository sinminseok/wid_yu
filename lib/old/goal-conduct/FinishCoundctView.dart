import 'package:flutter/material.dart';
import 'package:wid_yu/common/model/mission/Mission.dart';

class FinishConductView extends StatefulWidget {
  final Mission mission;


  FinishConductView(this.mission);

  @override
  _FinishConductViewState createState() => _FinishConductViewState();
}

class _FinishConductViewState extends State<FinishConductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
