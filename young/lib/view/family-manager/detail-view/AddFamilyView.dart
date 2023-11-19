
import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/FilePath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/family-manager/detail-view/AddOldView.dart';
import 'package:young/view/family-manager/detail-view/AddYoungView.dart';

class AddFamilyView extends StatefulWidget {
  const AddFamilyView({Key? key}) : super(key: key);

  @override
  _AddFamilyViewState createState() => _AddFamilyViewState();
}

class _AddFamilyViewState extends State<AddFamilyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '추가하기', color: kTextWhiteColor,),
      body: Column(
        children: [
          _buildMainText(),
          _buildYoungButton(),
          _buildOldButton(),
        ],
      ),
    );
  }

  Widget _buildMainText(){
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 60.h),
            width: 53.w,
            height: 53.h,
            child: Image.asset(commonImagePath + "icon/add_persion_icon.png"),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text("가족 구성원 추가하기", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.sp, color: wTextBlackColor),),
        ),
        Container(
          margin: EdgeInsets.only(top: 7.h),
          child: Text("추가할 가족구성원을 먼저 선택해 보세요.", style: TextStyle(fontSize: 18.sp, color: wTextBlackColor),),
        )
      ],
    );
  }

  Widget _buildOldButton(){
    return Container(margin: EdgeInsets.only(top: 15.h),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: AddOldView(),
              ),
            );
          },
          child: Stack(
            children: [
              Center(
                child: Container(

                  width: 311.w,
                  height: 168.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wBorderGreyColor, width: 0.4.w),
                    color: wGrey100Color,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 110.w,
                            height: 95.h,
                            margin: EdgeInsets.only(left: 30.w),
                            child: Image.asset(commonImagePath + "user/oldMan.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 50.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "보호자 추가",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24.sp,
                        color: wTextBlackColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "보호자로 회원가입, 로그인하여 \n부모님의 정보를 관리해요. ",
                      style: TextStyle(fontSize: 14.sp, color: kTextBlackColor),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget _buildYoungButton(){
    return Container(margin: EdgeInsets.only(top: 30.h),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: AddYoungView(),
              ),
            );
          },
          child: Stack(
            children: [
              Center(
                child: Container(

                  width: 311.w,
                  height: 168.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wBorderGreyColor, width: 0.4.w),
                    color: wGrey100Color,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 110.w,
                            height: 95.h,
                            margin: EdgeInsets.only(left: 30.w),
                            child: Image.asset(commonImagePath + "user/youngManBox.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 50.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "보호자 추가",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24.sp,
                        color: wTextBlackColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "보호자로 회원가입, 로그인하여 \n부모님의 정보를 관리해요. ",
                      style: TextStyle(fontSize: 14.sp, color: kTextBlackColor),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

}
