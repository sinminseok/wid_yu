//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:wid_yu/common/model/user/TestUser.dart';
// import 'package:wid_yu/common/text/CustomText.dart';
// import 'package:wid_yu/common/utils/Color.dart';
// import 'package:wid_yu/common/view/goal/goal-create/controller/GoalCreateController.dart';
//
// import '../controller/GoalEditController.dart';
//
// class SelectUser extends StatelessWidget {
//   GoalEditController controller;
//
//
//   SelectUser(this.controller);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         top: 26.w,
//         left: 14.w,
//       ),
//       width: 320.w,
//       height: 36.h,
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//           itemCount: controller.users.length,
//           itemBuilder: (BuildContext ctx, int idx) {
//             return _buildUser(controller.users[idx], idx);
//           }
//       )
//     );
//   }
//
//   Widget _buildUser(TestUser user, int index){
//     return Obx(() => controller.selectUser == user ? _buildSelectUser(user): _buildNotSelectUser(user, index));
//   }
//
//   Widget _buildSelectUser(TestUser user){
//     return Container(
//       width: 88.w,
//       height: 36.w,
//       margin: EdgeInsets.only(right: 8.w),
//       decoration: BoxDecoration(
//           border: Border.all(color: wOrange200Color),
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//           color: wOrangeColor
//       ),
//       child: Center(
//         child: Title3Text(user.name, wWhiteColor),
//       ),
//     );
//   }
//
//   Widget _buildNotSelectUser(TestUser user, int index){
//     return Container(
//       width: 88.w,
//       height: 36.w,
//       margin: EdgeInsets.only(right: 8.w),
//       decoration: BoxDecoration(
//           border: Border.all(color: wGrey300Color),
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//           color: wWhiteColor
//       ),
//       child: InkWell(
//         onTap: (){
//           controller.pickUser(index);
//         },
//         child: Center(
//           child: Title3Text(user.name, wGrey300Color),
//         ),
//       ),
//     );
//   }
// }
