import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';
import 'package:wid_yu/young/goal/goal-edit/controller/GoalEditController.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/view/goal/popup/GoalPopup.dart';
import '../widgets/EditMissionAddTime.dart';
import '../widgets/EditMissionSelectPhoto.dart';
import '../widgets/EditMissionSetTime.dart';
import '../widgets/EditMissionTerm.dart';
import '../widgets/EditMissionTextForm.dart';
import '../widgets/EditMissionType.dart';

class GoalEditView extends StatefulWidget {
  bool _isOld;
  GoalResponse _goalResponse;

  GoalEditView(this._isOld, this._goalResponse);

  @override
  _GoalEditView createState() => _GoalEditView();
}

class _GoalEditView extends State<GoalEditView> {



  @override
  Widget build(BuildContext context) {
    GoalEditController controller = GoalEditController(widget._goalResponse);
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
            //EditMissionSelectPhoto(controller),
            _buildSaveButton(controller),
            _buildDeleteGoal(controller),
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

  Widget _buildDeleteGoal(GoalEditController _controller) {
    return Container(
      height: 24.h,
      margin: EdgeInsets.only(bottom: 60.h),
      child: InkWell(
        onTap: ()async{
          bool response = await _controller.deleteGoal(widget._goalResponse.goalIdx!);
          if(response){
            widget._isOld?Get.to(() => OldFrameView(0)): Get.to(() => YoungFrameView(0));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('목표가 삭제 됐습니다.'),
              duration: Duration(seconds: 3),
              action: SnackBarAction(
                label: '확인',
                onPressed: () {},
              ),
            ));

          }else{
            
          }
        },
        child: Center(
          child: ButtonText("목표 삭제하기", wErrorColor),
        ),
      ),
    );
  }

  Widget _buildSaveButton(GoalEditController controller) {
    return _buildCanSaveButton(controller);
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

  Widget _buildCanSaveButton(GoalEditController _controller){
    return InkWell(
      onTap: () {
        _controller.updateGoal(context, widget._isOld);
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
