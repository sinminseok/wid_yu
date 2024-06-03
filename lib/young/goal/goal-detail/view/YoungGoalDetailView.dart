import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/young/goal/goal-detail/controller/YoungGoalDetailController.dart';
import 'package:wid_yu/young/goal/goal-detail/widgets/YoungGoalCalendar.dart';

import '../../../../common/utils/Color.dart';
import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../../final-dto/young-dto/response/user/YoungMainGoalResponse.dart';
import '../widgets/GoalDetailHeader.dart';
import '../widgets/TodayMissions.dart';

class YoungGoalDetailView extends StatefulWidget {
  YoungMainGoalResponse _youngInformation;
  List<GoalResponse> _goals;


  YoungGoalDetailView(this._youngInformation, this._goals);

  @override
  _GoalDetailView createState() => _GoalDetailView();
}

class _GoalDetailView extends State<YoungGoalDetailView> {


  @override
  Widget build(BuildContext context) {
    YoungGoalDetailController _controller = YoungGoalDetailController(widget._goals);
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "",color: wPurpleBackGroundColor,),
      backgroundColor: wPurpleBackGroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FutureBuilder(future: _controller.loadInit(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if (snapshot.hasError){
            return Text("ERR");
          }else{
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: (){
                    },
                    child: GoalDetailHeader(widget._youngInformation.name!, widget._youngInformation.percentage!)),
                TodayMission(_controller),
                YoungGoalCalendar(_controller)
              ],
            );
          }
        },)
      ),
    );
  }
}
