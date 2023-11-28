import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/view/goal/goal-edit/controller/GoalEditController.dart';
import 'package:wid_yu/common/view/goal/goal-edit/popup/DeleteMissionFinishPopup.dart';
import 'package:wid_yu/common/view/goal/goal-edit/popup/DeleteMissionPopup.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionInformationForm.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionTime.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionType.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionTerm.dart';

import '../../../utils/Color.dart';

class GoalEditView extends StatefulWidget {
  const GoalEditView({Key? key}) : super(key: key);

  @override
  State<GoalEditView> createState() => _GoalEditViewState();
}

class _GoalEditViewState extends State<GoalEditView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _drugDountController = TextEditingController();
  TextEditingController _hourController = TextEditingController(text: "1");
  TextEditingController _minuteController = TextEditingController(text: "1");

  GoalEditController controller = GoalEditController();

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
              "목표수정",
              style: TextStyle(color: kTextBlackColor, fontSize: 17.sp),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditMissionType(controller),
            EditMissionInformationForm(
                _titleController, _contentController, controller),
            EditMissionTerm(controller),
            EditMissionTime(controller, _drugDountController, _hourController,
                _minuteController),
            // MissionSelectPhoto(_switchValue),
            _buildSaveButton()
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            //GoalPopup().createGoalPopup(context, widget.isOld);
            //SaveFinishPopup().showDialog(context);
          },
          child: Center(
            child: Container(
              width: 335.w,
              height: 44.h,
              margin: EdgeInsets.only(top: 50.h, bottom: 20.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: wOrangeColor),
              child: Center(
                child: Text(
                  "변경사항 저장하기",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            DeleteMissionPopup().showDialog(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 30.h),
            child: Center(
              child: Text("목표 삭제하기", style: TextStyle(fontWeight: FontWeight.w600,color: wErrorColor, fontSize: 14.sp),),
            ),
          ),
        )
      ],
    );
  }
}
