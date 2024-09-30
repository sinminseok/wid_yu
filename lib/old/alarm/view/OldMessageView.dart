import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/old/alarm/controller/OldAlarmController.dart';
import 'package:wid_yu/old/alarm/widgets/GoalPercentageAlarm.dart';
import 'package:wid_yu/old/alarm/widgets/OldNotSuccessGoalAlarm.dart';
import 'package:wid_yu/old/alarm/widgets/OldTodoGoalWidget.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/utils/Color.dart';
import '../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../final-dto/old-dto/response/user/OldMainGoalResponse.dart';
import '../../../sql-lite/Meaasge.dart';
import '../../../sql-lite/NoicationDatabase.dart';
import '../../../utils/GoalAlarmMessageFilter.dart';
import '../widgets/AllGoalSuccessAlarm.dart';
import '../widgets/OldHealthAlarm.dart';
import '../widgets/OldSuccessGoalWidget.dart';

class OldMessageView extends StatefulWidget {
  List<GoalResponse> _goals;
  List<GoalResponse> _totalGoals;
  OldMainGoalResponse _oldInformation;


  OldMessageView(this._goals, this._totalGoals,this._oldInformation);

  @override
  _OldMessageViewState createState() => _OldMessageViewState();
}

class _OldMessageViewState extends State<OldMessageView> {
  OldAlarmController controller = OldAlarmController();

  final dbHelper = DatabaseHelper.instance;
  late Future<List<MessageFcm>> messages;

  @override
  void initState() {
    super.initState();
    messages = dbHelper.fetchAllMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '알림',
        color: wWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 720.h,
              width: 370.w,
              child: FutureBuilder<List<MessageFcm>>(
                future: messages,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No messages'));
                  } else {
                    final messages = snapshot.data!;
                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        // 역순으로 표시하기 위해 reversed 리스트 사용
                        bool canShow = true;
                        // 역순으로 표시하기 위해 reversed 리스트 사용
                        final message = messages.reversed.toList()[index];
                        int state = message.checkTitle();

                        if (state == 1) {
                          var filterSuccessGoal = GoalAlarmMessageFilter()
                              .filterSuccessGoal(message!, widget._totalGoals);
                          if (filterSuccessGoal == null) {
                            canShow = false;
                          }
                        }
                        if (state == 0) {
                          var filterSuccessGoal = GoalAlarmMessageFilter()
                              .filterTodoGoal(message!, widget._totalGoals);
                          if (filterSuccessGoal == null) {
                            canShow = false;
                          }
                        }
                        return !canShow
                            ? Container()
                            : Container(
                          width: 360.w,
                          height: 110.h,
                          child: Row(
                            children: [
                              _filterMessage(message),
                              // Container(
                              //   child: InkWell(
                              //     onTap: () async {
                              //       await dbHelper.deleteMessage(message.id!);
                              //       setState(() {
                              //         this.messages = dbHelper.fetchAllMessages();
                              //       });
                              //     },
                              //     child: Icon(Icons.delete),
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * 1 은 목표를 성공했을때
   * 0 은 목표를 수행할 시간일때
   */
  Widget _filterMessage(MessageFcm messageFcm) {
    int state = messageFcm.checkTitle();
    if (state == 2) {
      return AllGoalSuccessAlarm( messageFcm);
    }
    if (state == 1) {
      var filterSuccessGoal = GoalAlarmMessageFilter().filterSuccessGoal(messageFcm!, widget._totalGoals);
      return filterSuccessGoal == null?Container():OldSuccessGoalAlarm( filterSuccessGoal, messageFcm, widget._goals, widget._oldInformation);
    }
    if (state == 0) {
      var filterSuccessGoal = GoalAlarmMessageFilter().filterTodoGoal(messageFcm!, widget._totalGoals);
      return OldTodoGoalWidget(dbHelper, filterSuccessGoal,  messageFcm);
    }
    if(state == -1) {
      return OldNotSuccessGoalAlarm(true, dbHelper,  messageFcm);
    }
    if(state == -2){
      return OldHealthAlarm(true, dbHelper, messageFcm);
    }

    return Container();
  }
}
