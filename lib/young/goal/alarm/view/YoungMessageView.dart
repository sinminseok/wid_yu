import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/old/alarm/widgets/AllGoalSuccessAlarm.dart';
import 'package:wid_yu/sql-lite/Meaasge.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';
import 'package:wid_yu/young/goal/alarm/widgets/AllReadPhotoAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/AllReadVideoAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/DangerousOldAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/GoalPercentageAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/OldGoalPercentageAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/OldNotSuccessGoalAlarm.dart';

import '../../../../common/utils/CustomText.dart';
import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../../final-dto/young-dto/response/user/YoungMainGoalResponse.dart';
import '../../../../old/alarm/widgets/OldHealthAlarm.dart';
import '../../../../old/alarm/widgets/OldNotSuccessGoalAlarm.dart';
import '../../../../sql-lite/NoicationDatabase.dart';
import '../../../../utils/GoalAlarmMessageFilter.dart';
import '../widgets/GoalTodoAlarm.dart';
import '../widgets/YoungSuccessGoalAlarm.dart';

class YoungMessageView extends StatefulWidget {
  YoungMainGoalResponse _youngInformation;
  List<GoalResponse> _totalGoals;
  List<GoalResponse> _goals;

  YoungMessageView(this._youngInformation, this._totalGoals, this._goals);

  @override
  _YoungMessageViewState createState() => _YoungMessageViewState();
}

class _YoungMessageViewState extends State<YoungMessageView> {
  YoungAlarmController controller = YoungAlarmController();

  final dbHelper = DatabaseHelper.instance;
  late Future<List<MessageFcm>> messages;

  @override
  void initState() {
    super.initState();
    messages = dbHelper.fetchAllMessages();
  }

  void loadMessage() async {
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
                                    Container(

                                        child: _filterMessage(message)),

                                    // Container(
                                    //   child: InkWell(
                                    //     onTap: () async {
                                    //       await dbHelper
                                    //           .deleteMessage(message.id!);
                                    //       setState(() {
                                    //         this.messages =
                                    //             dbHelper.fetchAllMessages();
                                    //       });
                                    //     },
                                    //     child: Icon(Icons.delete, size: 17.sp,),
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

  Widget _filterMessage(MessageFcm messageFcm) {
    int state = messageFcm.checkTitle();
    if (state == 2) {
      return AllGoalSuccessAlarm(messageFcm);
    }
    if (state == 1) {
      return YoungSuccessGoalAlarm(
          GoalAlarmMessageFilter()
              .filterSuccessGoal(messageFcm!, widget._totalGoals),
          messageFcm,
          widget._goals,
          widget._youngInformation);
    }
    if (state == 0) {
      return YoungGoalTodoAlarm(
          dbHelper,
          messageFcm,
          GoalAlarmMessageFilter()
              .filterTodoGoal(messageFcm!, widget._totalGoals));
    }
    if (state == -1) {
      return OldNotSuccessGoalAlarm(false, dbHelper, messageFcm);
    }
    if(state == -2){
      return OldHealthAlarm(false, dbHelper, messageFcm);
    }
    return Container();
  }
}
