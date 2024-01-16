import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/view/goal/popup/GoalPopup.dart';
import '../../../../old/goal/goal-create/popup/OldGoalPopup.dart';
import '../controller/YoungGoalCreateController.dart';
import '../popup/YoungGoalPopup.dart';
import '../widgets/YoungMissionAddTime.dart';
import '../widgets/YoungMissionSetTime.dart';
import '../widgets/YoungMissionTerm.dart';
import '../widgets/YoungMissionText.dart';
import '../widgets/YoungMissionType.dart';
import '../widgets/YoungSelectPhoto.dart';
import '../widgets/YoungSelectUser.dart';


class YoungGoalCreateView extends StatefulWidget {


  @override
  _YoungGoalCreateView createState() => _YoungGoalCreateView();
}

class _YoungGoalCreateView extends State<YoungGoalCreateView> {
  YoungGoalCreateController controller = YoungGoalCreateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoungMissionType(controller),
            YoungSelectUser(controller),
            YoungMissionText(controller),
            YoungMissionTerm(controller),
            YoungMissionSetTime(controller),
            YoungMissionAddTime(controller),
            YoungMissionSelectPhoto(controller),
            _buildSaveButton()
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
              "목표생성",
              kTextBlackColor
          )),
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
          margin: EdgeInsets.only(top: 50.h,bottom: 60.h,right: 20.w, left: 20.w),
          decoration: BoxDecoration(
              border: Border.all(color: wGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: wGrey100Color),
          child: Center(
            child: ButtonText("저장하기", wGrey400Color),
          )
      ),

    );
  }

  Widget _buildCanSaveButton(){
    return InkWell(
      onTap: () {
        var createGoal = controller.createGoal();
        YoungGoalPopup().createGoalPopup(context);
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
