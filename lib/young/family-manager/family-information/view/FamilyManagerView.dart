import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserResponse.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/view/EditOldView.dart';
import 'package:wid_yu/young/family-manager/family-information/controller/FamilyManagerController.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/utils/Color.dart';
import '../../../../final-dto/common-dto/response/user/UserProfileResponse.dart';
import '../../dto/OldInformationResponseDto.dart';
import '../../dto/YoungInformationResponseDto.dart';
import '../../family-add/AddFamilyView.dart';
import '../../family-edit/young-edit/view/EditYoungView.dart';

class FamilyManagerByYoung extends StatefulWidget {
  const FamilyManagerByYoung({Key? key}) : super(key: key);

  @override
  State<FamilyManagerByYoung> createState() => _FamilyManagerByYoungState();
}

class _FamilyManagerByYoungState extends State<FamilyManagerByYoung> {
  FamilyManagerByYoungController controller = FamilyManagerByYoungController();

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
        appBar: CommonAppBar(
          canBack: true,
          title: '가족정보',
          color: wPurpleBackGroundColor,
        ),
        body: FutureBuilder(
          future: controller.loadInit(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("error");
            } else {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: controller.myUser.map((old) {
                        return _buildYoungsInformation(old);
                      }).toList(),
                    ),
                    _buildOldsInformation(),
                  ],
                ),
              );
            }
          },
        ));
  }

  FloatingActionButton _buildAddButton() {
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
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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

  Widget _buildYoungsInformation(YoungInformationResponseDto young) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: wGrey100Color),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: (EditYoungView(young))));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13.w, top: 9.h, bottom: 9.h),
                    child: Stack(
                      children: [
                        Container(
                          width: 68.w,
                          height: 68.h,
                          decoration: BoxDecoration(
                              color: wGrey200Color, shape: BoxShape.circle),
                        ),
                        young.profileImageUrl == null
                            ? Container(
                                width: 68.w,
                                height: 68.h,
                                child: Image.asset(
                                    "assets/common/user/youngMan.png"),
                              )
                            : Container(
                                width: 68.w,
                                height: 68.h,
                                child: Image.network(young.profileImageUrl!),
                              )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.h, left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 27.h,
                              child:
                                  Title3Text("${young.name} 님", wGrey800Color),
                            ),
                            Container(
                              height: 21.h,
                              margin: EdgeInsets.only(left: 10.w),
                              child: Body2Text("@${young.id}", wGrey500Color),
                            )
                          ],
                        ),
                        Container(
                          height: 24.h,
                          margin: EdgeInsets.only(top: 3.h),
                          child:
                              Body1Text("${young.phoneNumber}", wGrey800Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20.w),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: (EditYoungView(young))));
                    },
                    child: Image.asset(
                      "assets/images/icon/next-icon.png",
                      color: wGrey500Color,
                      width: 6.w,
                      height: 12.h,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOldsInformation() {
    return Container(
      width: 360.w,
      margin: EdgeInsets.only(top: 60.h),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: controller.olds.map((old) {
            return _buildOldCard(old);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildOldCard(OldInformationResponseDto user) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: wGrey100Color),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: (OldEditByYoungView(user))));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13.w, top: 9.h, bottom: 9.h),
                    child: Stack(
                      children: [
                        Container(
                          width: 68.w,
                          height: 68.h,
                          decoration: BoxDecoration(
                              color: wGrey200Color, shape: BoxShape.circle),
                        ),
                        user.profileImageUrl == null?Container(
                          width: 68.w,
                          height: 68.h,
                          child: Image.asset(
                              "assets/common/user/old-man-circle.png"),
                        ):Container(
                          width: 68.w,
                          height: 68.h,
                          child: Image.network(user.profileImageUrl!),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.h, left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 27.h,
                              child:
                                  Title3Text("${user.name} 님", wGrey800Color),
                            ),
                            // Container(
                            //   height: 21.h,
                            //   margin: EdgeInsets.only(left: 10.w),
                            //   child: Body2Text("@${user.id}", wGrey500Color),
                            // )
                          ],
                        ),
                        Container(
                          height: 24.h,
                          margin: EdgeInsets.only(top: 3.h),
                          child: Body1Text("${user.phoneNumber}", wGrey800Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20.w),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: (OldEditByYoungView(user))));
                    },
                    child: Image.asset(
                      "assets/images/icon/next-icon.png",
                      color: wGrey500Color,
                      width: 6.w,
                      height: 12.h,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
