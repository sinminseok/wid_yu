


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/model/user/TestUser.dart';
import '../../../../common/utils/CustomText.dart';
import '../../../../common/utils/Color.dart';
import '../../family-edit/old-edit/view/OldEditByOldView.dart';
import '../../family-edit/young-edit/view/EditYoungByOld.dart';
import '../controller/OldFamilyManagerController.dart';

class OldFamilyManagerView extends StatefulWidget {
  const OldFamilyManagerView({Key? key}) : super(key: key);

  @override
  State<OldFamilyManagerView> createState() => _OldFamilyManagerView();
}

class _OldFamilyManagerView extends State<OldFamilyManagerView> {
  OldFamilyManagerController controller = OldFamilyManagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wOrangeBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '가족정보',color: wOrangeBackGroundColor, ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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


  Widget _buildYoungsInformation() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 24.h, left: 20.w,right: 20.w),
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: wGrey100Color),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: (YoungEditByOldView())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13.w,
                        top: 9.h,bottom: 9.h
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 68.w,
                          height: 68.h,
                          decoration: BoxDecoration(
                              color: wGrey200Color,
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
                        Row(
                          children: [
                            Container(
                              height: 27.h,
                              child: Title3Text("보호자 님",wGrey800Color),
                            ),
                            Container(
                              height: 21.h,
                              margin: EdgeInsets.only(left: 10.w),
                              child: Body2Text("@Dkdud12", wGrey500Color),
                            )
                          ],
                        ),
                        Container(
                          height: 24.h,
                          margin: EdgeInsets.only(top: 3.h),
                          child: Body1Text("010 9174 1764",wGrey800Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20.w),

                child: InkWell(
                    onTap: (){
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.fade,
                      //         child: (EditYoungView())));
                    },
                    child: Image.asset("assets/images/icon/next-icon.png", color: wGrey500Color,width: 6.w,height: 12.h,)),
              )
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildOldsInformation() {
    return Container(
      width: 380.w,
      height: 600.h,
      margin: EdgeInsets.only(top: 60.h),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: controller.olds.length,
          itemBuilder: (BuildContext ctx, int idx) {
            return _buildOldCard(controller.olds[idx]);
          }
      ),
    );
  }

  Widget _buildOldCard(TestUser user){
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h, left: 20.w,right: 20.w),
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: wGrey100Color),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: (OldEditByOldView())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13.w,
                        top: 9.h,bottom: 9.h
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 68.w,
                          height: 68.h,
                          decoration: BoxDecoration(
                              color: wGrey200Color,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: 68.w,
                          height: 68.h,
                          child: Image.asset("assets/common/user/old-man-circle.png"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.h,left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 27.h,
                              child: Title3Text("${user.name} 님",wGrey800Color),
                            ),
                            Container(
                              height: 21.h,
                              margin: EdgeInsets.only(left: 10.w),
                              child: Body2Text("@Dkdud12", wGrey500Color),
                            )
                          ],
                        ),
                        Container(
                          height: 24.h,
                          margin: EdgeInsets.only(top: 3.h),
                          child: Body1Text("010 9174 1764",wGrey800Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20.w),

                child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: (OldEditByOldView())));
                    },
                    child: Image.asset("assets/images/icon/next-icon.png", color: wGrey500Color,width: 6.w,height: 12.h,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}


