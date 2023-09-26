import 'package:common/model/mission/Mission.dart';
import 'package:common/model/mission/MissionType.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MissionWidget.dart';

class YoungMissionWidget extends StatefulWidget {
  const YoungMissionWidget({Key? key}) : super(key: key);

  @override
  _YoungMissionWidgetState createState() => _YoungMissionWidgetState();
}

class _YoungMissionWidgetState extends State<YoungMissionWidget> {
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              MissionWidget(items[index]),
              if (index < items.length - 1) Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 302,
                height: 1,
                color: kLightGreyColor,
                child: Divider(

                ),
              ), // 아이템 사이에 구분선 추가
            ],
          );
        }),
      ),
    ); //items의 크기만큼 MissionWidget을 보여줄거임);
  }
}
