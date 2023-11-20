import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/common-widget/CommonAppbar.dart';
import '../../common/utils/Color.dart';
import 'detail-view/AddFamilyView.dart';
import 'detail-view/EditOldView.dart';
import 'detail-view/EditYoungView.dart';

class FamilyManagerView extends StatefulWidget {
  const FamilyManagerView({Key? key}) : super(key: key);

  @override
  State<FamilyManagerView> createState() => _FamilyManagerViewState();
}

class _FamilyManagerViewState extends State<FamilyManagerView> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
              child: _buildAddButton()),
        ],
      ),
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '가족정보',color: wPurpleBackGroundColor, ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildYoungsInformation(),
            _buildOldsInformation(),
          ],
        ),
      ),

    );
  }

  FloatingActionButton _buildAddButton(){
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: AddFamilyView(),
          ),
        );
      },
      label: Container(
        child: Text(
          "가족 추가",
          style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
        ),
      ),
      icon: const Icon(
        Icons.add,
        size: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      backgroundColor: wPurpleColor,
    );
  }

  Widget _buildYoungsInformation() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kTextGreyColor, width: 0.4.w),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: (EditYoungView())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 68.w,
                          height: 68.h,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: 68.w,
                          height: 68.h,
                          child: Image.asset("assets/common/user/youngMan.png"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.h,left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("보호자 님",style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor, fontSize: 18.sp),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          child: Text("010 9174 1764",style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 15.w),

                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: (EditYoungView())));
                  },
                    child: Icon(Icons.navigate_next_outlined, color: kTextGreyColor,)),
              )
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildOldsInformation() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kTextGreyColor, width: 0.3.w),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 68.w,
                        height: 68.h,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        width: 65.w,
                        height: 65.h,
                        child: Image.asset("assets/common/user/oldMan.png"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h,left: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("보호자 님",style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor, fontSize: 18.sp),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.h),
                        child: Text("010 9174 1764",style: TextStyle(color: kTextBlackColor, fontSize: 16.sp),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: EditOldView(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 15.w),

                child: Icon(Icons.navigate_next_outlined, color: kTextGreyColor,),
              ),
            )
          ],
        ),
      ),
    );

  }
}


