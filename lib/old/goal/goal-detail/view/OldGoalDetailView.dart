import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/old/goal/goal-detail/controller/OldGoalDetailController.dart';
import 'package:wid_yu/old/goal/goal-detail/widgets/GoalCalendar.dart';
import 'package:wid_yu/old/goal/goal-detail/widgets/GoalDetailHeader.dart';
import 'package:wid_yu/old/goal/goal-detail/widgets/TodayMissions.dart';

import '../../../../common/utils/Color.dart';
import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';

class OldGoalDetailView extends StatefulWidget {
  List<GoalResponse> _goals;
  OldMainGoalResponse _oldInformation;


  OldGoalDetailView(this._oldInformation,this._goals);

  @override
  _GoalDetailView createState() => _GoalDetailView();
}

class _GoalDetailView extends State<OldGoalDetailView> {



  @override
  Widget build(BuildContext context) {
    OldGoalDetailController controller = OldGoalDetailController(widget._goals);
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "",color: wOrangeBackGroundColor,),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FutureBuilder(future: controller.loadInit(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if (snapshot.hasError){
            return Text("ERR");
          }else{
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GoalDetailHeader(controller, widget._oldInformation.percentage),
                TodayMissions(controller),
                GoalCalendar(controller)
              ],
            );
          }
        },)
      ),
    );
  }
}
