import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/album/detail-view/AddPhotoView.dart';
import 'package:young/view/album/widgets/PhotoWidget.dart';
import 'package:young/view/album/widgets/PointWidget.dart';

import '../family-manager/FamilyManagerView.dart';

class YoungAlbumView extends StatefulWidget {
  const YoungAlbumView({Key? key}) : super(key: key);

  @override
  _YoungAlbumViewState createState() => _YoungAlbumViewState();
}

class _YoungAlbumViewState extends State<YoungAlbumView> {

  bool isPhoto = true;
  bool isVideo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
              child: _buildExtendButton()),
        ],
      ),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainText(),
            _buildCurrentPoint(),
            _buildSelectRewardType(),
            isPhoto?_buildPhoto():Container(),
            isVideo?_buildVideo():Container()

          ],
        ),
      ),
    );
  }

  Widget _buildVideo(){
    return Container(
      child: Column(
        children: [],
      ),
    );
  }

  FloatingActionButton _buildExtendButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: AddPhotoView(),
          ),
        );
      },
      label: Container(
        child: Text(
          "새로운 사진 모으기",
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

  Widget _buildPhoto(){
    return Container(
      child:Column(
        children: [
          PhotoWidget(),
          PhotoWidget(),
          PhotoWidget(),
        ],
      ),
    );
  }

  Widget _buildSelectRewardType() {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isPhoto = true;
                  isVideo = false;
                });
              },
              child: Container(
                width: 158.w,
                height: 60.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: isPhoto?BorderSide(color: wOrangeColor,width: 2):BorderSide(color: kTextGreyColor,width: 0.5)
                    )
                ),
                child: Center(
                  child: Text("사진",style: TextStyle( color: isPhoto?wOrangeColor:kTextBlackColor),),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isPhoto = false;
                  isVideo = true;
                });
              },
              child: Container(
                width: 158.w,
                height: 60.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: isVideo?BorderSide(color: wOrangeColor,width: 2):BorderSide(color: kTextGreyColor,width: 0.5)
                    )
                ),
                child: Center(
                  child: Text("비디오",style: TextStyle( color: isVideo?wOrangeColor:kTextBlackColor),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: wOrangeBackGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w),
              width: 47.w,
              height: 30.h,
              child: Image.asset("assets/images/images/appbar_logo.png"),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.favorite_border,
                color: kTextBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "가족들의 소식이 궁금하세요?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: kTextBlackColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Text(
              "목표 달성으로 쌓은 포인트로 구매해서 볼 수 있어요.",
              style: TextStyle(fontSize: 16.sp, color: kTextBlackColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPoint() {
    return PointWidget();
  }
}
