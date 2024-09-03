import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/sql-lite/Meaasge.dart';
import 'package:wid_yu/young/goal/alarm/controller/YoungAlarmController.dart';
import 'package:wid_yu/young/goal/alarm/widgets/AllReadPhotoAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/AllReadVideoAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/DangerousOldAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/GoalPercentageAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/OldGoalPercentageAlarm.dart';
import 'package:wid_yu/young/goal/alarm/widgets/OldNotSuccessGoalAlarm.dart';

import '../../../../sql-lite/NoicationDatabase.dart';

class YoungMessageView extends StatefulWidget {
  const YoungMessageView({Key? key}) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '알림',
        color: wWhiteColor,
      ),
      body: SingleChildScrollView(
          child: Container(
        width: 360.w,
        child: Column(
          children: [
            //AllReadPhotoAlarm(controller),
            //AllReadVideoAlarm(controller),
            DangerousOldAlarm(controller),
            GoalPercentageAlarm(controller),
            //OldGoalPercentageAlarm(controller),
            OldNotSuccessGoalAlarm(controller),
            Container(
              height: 400.h,
              width: 200.w,
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
                        final message = messages[index];
                        return ListTile(
                          title: Text(message.title),
                          subtitle: Text(message.body),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              await dbHelper.deleteMessage(message.id!);
                              setState(() {
                                this.messages = dbHelper.fetchAllMessages();
                              });
                            },
                          ),
                          onTap: () async {
                            await dbHelper.markMessageAsRead(message.id!);
                            setState(() {
                              this.messages = dbHelper.fetchAllMessages();
                            });
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),

          ],
        )
      )),
    );
  }
}
