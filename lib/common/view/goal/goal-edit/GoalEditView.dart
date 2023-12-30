import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/view/goal/goal-create/widgets/MissionTypeWidget.dart';
import 'package:wid_yu/common/view/goal/goal-edit/controller/GoalEditController.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionAddTime.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionSelectPhoto.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionSetTime.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionTerm.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionTextForm.dart';
import 'package:wid_yu/common/view/goal/goal-edit/widgets/EditMissionType.dart';

import '../../../utils/Color.dart';
import '../popup/GoalPopup.dart';

class GoalEditView extends StatefulWidget {


  @override
  _GoalEditView createState() => _GoalEditView();
}

class _GoalEditView extends State<GoalEditView> {
  GoalEditController controller = GoalEditController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditMissionType(controller),
            // SelectUser(controller),
            EditMissionTextForm(controller),
            EditMissionTerm(controller),
            EditMissionSetTime(controller),
            EditMissionAddTime(controller),
            EditMissionSelectPhoto(controller),
            _buildSaveButton(),
            _buildDeleteGoal(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //뒤로가기
          },
          color: kTextBlackColor,
          icon: Icon(Icons.close)),
      title:  Container(
          margin: EdgeInsets.only(left: 0.w),
          child: Title3Text(
              "목표 수정",
              kTextBlackColor
          )),
    );
  }

  Widget _buildDeleteGoal() {
    return Container(
      height: 24.h,
      margin: EdgeInsets.only(bottom: 60.h),
      child: InkWell(
        onTap: (){

        },
        child: Center(
          child: ButtonText("목표 삭제하기", wErrorColor),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Obx(() => controller.canSaveMission?_buildCanSaveButton():_buildCanNotSaveButton());
  }

  Widget _buildCanNotSaveButton(){
    return Center(
      child: Container(
          width: 335.w,
          height: 44.h,
          margin: EdgeInsets.only(top: 50.h,bottom: 20.h,right: 20.w, left: 20.w),
          decoration: BoxDecoration(
              border: Border.all(color: wGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: wGrey100Color),
          child: Center(
            child: ButtonText("변경사항 저장하기", wGrey400Color),
          )
      ),

    );
  }

  Widget _buildCanSaveButton(){
    return InkWell(
      onTap: () {

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
            child: Text("변경사항 저장하기", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
