import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/view/goal/goal-create/widgets/MissionSelectPhoto.dart';
import 'package:wid_yu/common/view/goal/goal-create/widgets/MissionTermWidget.dart';
import 'package:wid_yu/common/view/goal/goal-create/widgets/MissionTextWidget.dart';
import 'package:wid_yu/common/view/goal/goal-create/widgets/MissionTimeWidget.dart';
import 'package:wid_yu/common/view/goal/goal-create/widgets/MissionTypeWidget.dart';

import '../../../utils/Color.dart';
import '../popup/GoalPopup.dart';

class GoalCreateView extends StatefulWidget {
  const GoalCreateView({Key? key}) : super(key: key);

  @override
  _GoalCreateViewState createState() => _GoalCreateViewState();
}

class _GoalCreateViewState extends State<GoalCreateView> {
  //todo 백엔드 작업 끝나면 DTO 로 상태를 관리할 수 있도록 변경
  bool drug = false;
  bool outing = false;
  bool common = false;

  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;

  bool morning = false;
  bool afternoon = false;

  bool _switchValue = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: kTextBlackColor,
            icon: Icon(Icons.close)),
        title: Container(
            margin: EdgeInsets.only(left: 80.w),
            child: Text(
              "목표생성",
              style: TextStyle(color: kTextBlackColor, fontSize: 17.sp),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MissionTypeWidget(drug, outing, common),
            MissionTextWidget(_titleController, _contentController),
            MissionTermWidget(monday, tuesday, wednesday, thursday, friday, saturday, sunday),
            MissionSetTimeWidget(),
            MissionSelectPhoto(_switchValue),
            _buildSaveButton()
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return InkWell(
      onTap: () {
        GoalPopup().createGoalPopup(context, false);
        //SaveFinishPopup().showDialog(context);
      },
      child: Center(
        child: Container(
          width: 335.w,
          height: 44.h,
          margin: EdgeInsets.only(top: 50.h,bottom: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: wOrangeColor),
          child: Center(
            child: Text("저장하기", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
