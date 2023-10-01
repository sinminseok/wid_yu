import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OldGoalDetailView extends StatefulWidget {
  const OldGoalDetailView({Key? key}) : super(key: key);

  @override
  _OldGoalDetailViewState createState() => _OldGoalDetailViewState();
}

class _OldGoalDetailViewState extends State<OldGoalDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}
