import 'package:common/model/mission/Mission.dart';
import 'package:common/model/mission/MissionType.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MissionWidget.dart';


class MissionGroupWidget extends StatefulWidget {
  const MissionGroupWidget({Key? key}) : super(key: key);

  @override
  _MissionGroupWidgetState createState() => _MissionGroupWidgetState();
}

class _MissionGroupWidgetState extends State<MissionGroupWidget> {
  final List<Mission> items = [
    Mission("위염약", "~~복용하세요", MissionType.DRUG),
    Mission("런닝", "~~복용하세요", MissionType.WALK),
    Mission("독서", "~~복용하세요", MissionType.COMMON),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      decoration: BoxDecoration(
        border: Border.all(color: wBorderGreyColor),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: _buildMissionWidgets(),
        ),
      ),
    );
  }

  List<Widget> _buildMissionWidgets() {
    List<Widget> missionWidgets = [];

    for (int index = 0; index < items.length; index++) {
      missionWidgets.add(MissionWidget(items[index]));

      if (index < items.length - 1) {
        missionWidgets.add(
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 340,
            height: 1,
            color: kLightGreyColor,
          ),
        );
      }else{
        missionWidgets.add(
            Container(height: 15.h,)
        );
      }
    }

    return missionWidgets;
  }
}
