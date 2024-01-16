import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/test-controller/TestController.dart';
import 'package:wid_yu/old/album/main/controller/OldAlbumController.dart';
import 'package:wid_yu/old/album/main/widgets/OldEmptyPhoto.dart';

import '../../photo-detail/view/OldPhotoDetailView.dart';
import '../../widgets/OldPhotoWidget.dart';

class OldPhotos extends StatelessWidget {
  OldAlbumController controller;

  OldPhotos(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isPhoto ? _buildFilterEmpty() : Container());
  }

  Widget _buildFilterEmpty() {
    return true ? OldEmptyPhoto() : _buildPhotos();
  }

  Widget _buildPhotos() {
    return controller.isBigShow ? _buildBigPhotos() : _buildSmallPhotos();
  }

  Widget _buildBigPhotos() {
    return Container(
      child: Column(
        children: [
          OldPhotoWidget(),
          // OldPhotoWidget(),
          // OldPhotoWidget(),
        ],
      ),
    );
  }

  Widget _buildSmallPhotos() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
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
            return InkWell(
              onTap: () {
                Get.to(() => OldPhotoDetailView());
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
