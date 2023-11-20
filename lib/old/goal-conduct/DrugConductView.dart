
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/model/mission/Mission.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/goal-conduct/widget/ConductAppbar.dart';

class DrugConductView extends StatefulWidget {
  final Mission mission;


  DrugConductView(this.mission);

  @override
  _DrugConductViewState createState() => _DrugConductViewState();
}

class _DrugConductViewState extends State<DrugConductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConductAppBar(widget.mission.title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTimeAndDrugCount(),
          _buildTimes(),
          _buildDrugImage(),
        ],
      ),
    );
  }

  Widget _buildTimes(){
    return Container();
  }
  
  Widget _buildDrugImage(){
    return Container(
      width: 200.w,
      height: 180.h,
      child: Image.asset(commonImagePath + "goal-conduct/drug.png"),
    );
  }

  Widget _buildTimeAndDrugCount(){
    return Column(children: [
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 50.h),
          child: Text("20:00", style: TextStyle(fontSize: 40.sp, color: wGrey800Color, fontWeight: FontWeight.bold),),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Text("약 4개", style: TextStyle(fontSize: 14.sp, color: wGrey800Color),),
      )
    ],);
  }
}
