import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/test-controller/TestController.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/album/like-photo/view/LikePhotoView.dart';
import 'package:wid_yu/old/album/main/controller/OldAlbumController.dart';
import 'package:wid_yu/old/album/main/widgets/OldAlbumAppBar.dart';
import 'package:wid_yu/old/album/main/widgets/OldAlbumFloatingButton.dart';
import 'package:wid_yu/old/album/main/widgets/OldPhotos.dart';
import 'package:wid_yu/old/album/main/widgets/SelectRewardType.dart';
import 'package:wid_yu/old/album/widgets/OldPhotoWidget.dart';

import '../../../../common/utils/Color.dart';
import '../../../../young/album/main/widgets/PointWidget.dart';
import '../../collect-new-photo/view/CollectPhotoView.dart';

class OldAlbumView extends StatefulWidget {



  @override
  _OldAlbumViewState createState() => _OldAlbumViewState();
}

class _OldAlbumViewState extends State<OldAlbumView> {

  OldAlbumController controller = OldAlbumController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: OldAlbumAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
                child: OldAlbumFloatingButton()),
          ],
        ),
        backgroundColor: wOrangeBackGroundColor,
        body: SingleChildScrollView(
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainText(),
               PointWidget(),
              SelectRewardType(controller),
              OldPhotos(controller),
              controller.isVideo ? _buildVideo() : Container()
            ],
          ))
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
            child: Title2Text(
              "가족들의 소식이 궁금하세요?",
                kTextBlackColor
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.h),
            child: Body1Text(
              "목표 달성으로 쌓은 포인트로 구매해서 볼 수 있어요.",
                kTextBlackColor
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildVideo() {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }


}
