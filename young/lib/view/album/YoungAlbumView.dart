import 'package:common/utils/Color.dart';
import 'package:common/utils/FilePath.dart';
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
      backgroundColor: wPurpleBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAllRead(),
            
            _buildSelectRewardType(),
            isPhoto ? _buildPhoto() : Container(),
            isVideo ? _buildVideo() : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildAllRead() {
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 335.w,
            height: 75.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(4, 4),
                    color: Colors.black.withOpacity(0.2),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: kTextWhiteColor
            ),
            child: Row(
              children: [
                Container(
                  child: Image.asset(youngImagePath + "album/camera.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text("부모님께서 모든 사진을 읽었어요.\n새로운 사진을 올려주세요!",
                    style: TextStyle(fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: wGrey800Color),),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(right: 5.w),
                child: Icon(Icons.cancel,color: wGrey600Color,),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildVideo() {
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
          "사진 올리기",
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

  Widget _buildPhoto() {
    return Container(
      child: Column(
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
                        bottom: isPhoto
                            ? BorderSide(color: wPurpleColor, width: 2)
                            : BorderSide(color: kTextGreyColor, width: 0.5))),
                child: Center(
                  child: Text(
                    "사진",
                    style: TextStyle(
                        color: isPhoto ? wPurpleColor : kTextBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
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
                        bottom: isVideo
                            ? BorderSide(color: wPurpleColor, width: 2)
                            : BorderSide(color: kTextGreyColor, width: 0.5))),
                child: Center(
                  child: Text(
                    "비디오",
                    style: TextStyle(
                        color: isVideo ? wPurpleColor : kTextBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
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
      backgroundColor: wPurpleBackGroundColor,
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
              child: Image.asset("assets/common/common/appbar_logo.png"),
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
}


