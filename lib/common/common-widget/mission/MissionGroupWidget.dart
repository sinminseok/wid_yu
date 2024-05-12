// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wid_yu/common/dto/goal/Goal.dart';
// import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
//
// import '../../utils/Color.dart';
// import 'MissionWidget.dart';
//
//
// class MissionGroupWidget extends StatelessWidget {
//   final List<GoalResponse> goals;
//
//
//   MissionGroupWidget(this.goals);
//
//   // final List<Mission> items = [
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 335.w,
//       decoration: BoxDecoration(
//         border: Border.all(color: wGrey100Color),
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: Colors.white,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: _buildMissionWidgets(),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildMissionWidgets() {
//     List<Widget> missionWidgets = [];
//
//     for (int index = 0; index < goals.length; index++) {
//       missionWidgets.add(MissionWidget(goals[index]));
//
//       if (index < goals.length - 1) {
//         missionWidgets.add(
//           Container(
//             margin: EdgeInsets.only(top: 15.h),
//             width: 340,
//             height: 1,
//             color: kLightGreyColor,
//           ),
//         );
//       }else{
//         missionWidgets.add(
//             Container(height: 15.h,)
//         );
//       }
//     }
//
//     return missionWidgets;
//   }
// }
