import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/album/widgets/YoungPhotoWidget.dart';

import '../../common/utils/Color.dart';
import '../../common/utils/FilePath.dart';
import 'detail-view/AddPhotoView.dart';

class YoungAlbumView extends StatefulWidget {
  const YoungAlbumView({Key? key}) : super(key: key);

  @override
  _YoungAlbumViewState createState() => _YoungAlbumViewState();
}

class _YoungAlbumViewState extends State<YoungAlbumView> {
  bool isPhoto = true;
  bool isVideo = false;
  bool isBigShow = true;
  bool isReadAlarm = true;

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
            _buildSelectRewardType(),
            isPhoto ? _buildPhotos() : Container(),
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
                color: wWhiteColor),
            child: Row(
              children: [
                Container(
                  child: Image.asset(youngImagePath + "album/camera.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "부모님께서 모든 사진을 읽었어요.\n새로운 사진을 올려주세요!",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: wGrey800Color),
                  ),
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
              onTap: () {
                setState(() {
                  isReadAlarm = false;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 5.w),
                child: Icon(
                  Icons.cancel,
                  color: wGrey600Color,
                ),
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
            //AddPhotoView
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

  Widget _buildPhotos() {
    return isBigShow ? _buildBigPhotos() : _buildSmallPhotos();
  }

  Widget _buildBigPhotos() {
    return Container(
      child: Column(
        children: [
          YoungPhotoWidget(context),
          YoungPhotoWidget(context),
          YoungPhotoWidget(context),
        ],
      ),
    );
  }

  Widget _buildSmallPhotos() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 20.h),
        width: 320.w,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 1.3 / 1, //item 의 가로 1, 세로 1 의 비율
            mainAxisSpacing: 1, //수평 Padding
            crossAxisSpacing: 3.w, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            // return Text(index.toString());
            return Container(
              width: 116.w,
              height: 75.h,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Image.asset(
                  "assets/common/album/family_photo.png",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSelectRewardType() {
    return Column(
      children: [
        Center(
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
                                : BorderSide(
                                    color: kTextGreyColor, width: 0.5))),
                    child: Center(
                      child: Text(
                        "사진",
                        style: TextStyle(
                            color: isPhoto ? wPurpleColor : wGrey500Color,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
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
                                : BorderSide(
                                    color: kTextGreyColor, width: 0.5))),
                    child: Center(
                      child: Text(
                        "비디오",
                        style: TextStyle(
                            color: isVideo ? wPurpleColor : wGrey600Color,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        isReadAlarm ? _buildAllRead() : Container(),
        Container(
          margin: EdgeInsets.only(
            top: 9.h,
          ),
          width: 320.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              InkWell(
                onTap: () {
                  setState(() {
                    isBigShow = !isBigShow;
                  });
                },
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: 14.w,
                        height: 14.h,
                        child: Image.asset(commonImagePath +
                            "icon/photo-type-select-icon.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w),
                        child: Text(
                          isBigShow ? "크게 보기" : "작게 보기",
                          style: TextStyle(
                              color: isBigShow ? wPurpleColor : wGrey600Color,
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
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
            Container(),
          ],
        ),
      ),
    );
  }
}
