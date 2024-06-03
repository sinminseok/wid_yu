

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../old/frame/OldFrameView.dart';
import '../../FinishConductView.dart';
import '../controller/WalkConductController.dart';

class WalkConductView extends StatefulWidget {
  GoalResponse goalResponse;
  bool isOld;


  WalkConductView(this.goalResponse, this.isOld);

  @override
  State<WalkConductView> createState() => _WalkConductViewState();
}

class _WalkConductViewState extends State<WalkConductView> {

  late WalkConductController _controller;


  @override
  void initState() {
    _controller = WalkConductController(widget.goalResponse);
    _controller.selectTodoTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildGoalInformation(),
              // _buildGoalInformation(),
              _buildImage(),
            ],
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton(){
    return Container(
      margin: EdgeInsets.only(bottom: 60.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 24.h,
            child: ButtonText("다시 알림", wPurpleColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 335.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 108.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: wGrey300Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: wGrey200Color
                  ),
                  child: Center(
                    child: ButtonText("끄기", wGrey600Color),
                  ),
                ),
                Container(
                  width: 221.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: wOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: wOrange200Color)
                  ),
                  child: InkWell(
                    onTap: () async{
                      var response = await _controller.conductGoal();
                      Get.offAll(() => FinishConductView(widget.isOld));
                      // if(response){
                      //   Get.offAll(() => FinishConductView(widget.isOld));
                      // }else{
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text('네트워크 오류.'),
                      //     duration: Duration(seconds: 3),
                      //     action: SnackBarAction(
                      //       label: '확인',
                      //       onPressed: () {},
                      //     ),
                      //   ));
                      //
                      // }

                    },
                    child: Center(
                      child: ButtonText("수행하기", wWhiteColor),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGoalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 50.h),
            child: LargeTitleText("${_controller.todoTime?.time}", wGrey800Color),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: SubTitle2Text("${_controller.goal.description}", wGrey800Color),
        )
      ],
    );
  }

  Widget _buildImage(){
    return Container(
      margin: EdgeInsets.only(top: 90.h),
      width: 200.w,
      height: 200.h,
      child: Image.asset("assets/images/mission/walk.png"),
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: wWhiteColor,
      automaticallyImplyLeading: false,
      title:Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                //여기에 코드 구현
                Navigator.pop(context);
                //Get.to(() => OldFrameView(0), transition: Transition.upToDown);

              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Image.asset("assets/images/icon/back-icon.png",   width: 11.w,
                    height: 19.h,fit: BoxFit.contain,)
              ),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 0.h, right: 20.w),
                    child: Title3Text(
                        "목표 제목",
                        kTextBlackColor
                    ))),
            Container()
          ],
        ),
      ),

    );
  }
}
