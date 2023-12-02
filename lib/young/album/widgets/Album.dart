

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/album/controller/YoungAlbumController.dart';

import '../wid/YoungPhotoWidget.dart';

class Album extends StatelessWidget {
  YoungAlbumController controller;
  Album(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        controller.isPhoto ? _buildPhotos(context) : Container(),
        controller.isVideo ? _buildVideo() : Container()
      ],
    ));
  }

  Widget _buildPhotos(BuildContext context) {
    return Obx(() =>controller.isBigShow ? _buildBigPhotos(context) : _buildSmallPhotos());
  }

  Widget _buildVideo() {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }

  Widget _buildBigPhotos(BuildContext context) {
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


}
