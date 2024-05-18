

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import 'package:wid_yu/young/album/main/controller/YoungAlbumController.dart';
import 'package:wid_yu/young/album/photo-detail/view/PhotoDetailView.dart';

import 'YoungPhotoWidget.dart';
import 'YoungVideoWidget.dart';

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
      margin: EdgeInsets.only(left: 0.w,top: 25.h),
      width: 310.w,
      child: SingleChildScrollView(
        child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (1 / 1.25),

            crossAxisCount: 2, // 가로에 2개의 열을 배치합니다
            mainAxisSpacing: 10.0, // 아이템 사이의 간격을 설정합니다
            crossAxisSpacing: 10.0, // 열 사이의 간격을 설정합니다
          ),
          itemCount: 1,
          itemBuilder: (context, index) {
            return YoungVideoWidget(controller.photos[1]);
          },
        ),
      ),
    );
  }

  //크게보기
  Widget _buildBigPhotos(BuildContext context) {
    return Column(
      children: controller.photos.map((photo) {
        return YoungPhotoWidget(photo);
      }).toList(),
    );
  }

  Widget _buildSmallPhotos() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 20.h),
        width: 320.w,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.photos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 1.3 / 1, //item 의 가로 1, 세로 1 의 비율
            mainAxisSpacing: 1, //수평 Padding
            crossAxisSpacing: 3.w, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            // return Text(index.toString());
            return InkWell(
              onTap: (){
                Get.to(() => PhotoDetailView(controller.photos[index]));
              },
              child: Container(
                width: 116.w,
                height: 75.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image.asset(
                    "assets/common/album/family_photo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
