// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../common/utils/Color.dart';
// import '../../../../common/utils/CustomText.dart';
// import '../../../../common/utils/FilePath.dart';
//
// class BlurPhoto extends StatefulWidget {
//   const BlurPhoto({Key? key}) : super(key: key);
//
//   @override
//   State<BlurPhoto> createState() => _BlurPhotoState();
// }
//
// class _BlurPhotoState extends State<BlurPhoto> {
//   bool isLike = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
//         width: 375.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           color: wWhiteColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.18),
//               spreadRadius: 5,
//               blurRadius: 4,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildPhoto(),
//             _buildPhotoInformation(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(){
//     return Container(
//       margin: EdgeInsets.only(top: 13.h,left: 21.w),
//       child: Row(
//         children: [
//           Container(
//             child: Row(
//               children: [
//                 Container(
//                   width: 40.w,
//                   height: 40.h,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: wGrey200Color
//                   ),
//                   child: Image.asset(commonImagePath + "user/youngMan.png"),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 9.w),
//                   child: SubTitle2Text("보호자2 님", wTextBlackColor),
//                 )
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPhoto(){
//     return Container(
//       margin: EdgeInsets.only(top: 15.h,left: 20.w,right: 20.w),
//       width: 335.w,
//       height: 210.h,
//       child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(3)),
//           child: Image.asset("assets/common/album/family_photo.png", fit: BoxFit.fitWidth,)),
//     );
//   }
//
//   Widget _buildPhotoInformation(){
//     return Container(
//       margin: EdgeInsets.only(top: 15.h,bottom: 20.h),
//       width: 310.w,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: 235.w,
//             height: 55.h,
//
//             child: Text("오늘 서울숲으로 나들ㅇ이가기 전에 찍어ddd오늘 서울숲으로 나들이어ddasdasdasddasdasdasdasdasdadasdasdasdasdsadasddd",
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//
//               style: TextStyle(height: 1.8.h,fontFamily: "body2",color: kTextBlackColor, fontWeight: FontWeight.w500,fontSize: 14.sp),),
//           ),
//           InkWell(
//               onTap: (){
//                 setState(() {
//                   isLike = !isLike;
//                 });
//               },
//               child: isLike?Container(
//                 child: Icon(Icons.favorite, color: wOrange200Color),
//               ):Container(
//                 child: Icon(Icons.favorite_border, color: wOrange200Color),
//               )
//           )
//         ],
//       ),
//     );
//   }
// }
