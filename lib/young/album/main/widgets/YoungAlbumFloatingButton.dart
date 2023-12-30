

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/album/main/controller/YoungAlbumController.dart';

import '../../../../common/utils/Color.dart';
import '../../add-photo/view/AddPhotoView.dart';
import '../../add-video/view/AddVideoView.dart';

class YoungAlbumFloatingButton extends StatefulWidget {
  final YoungAlbumController controller;


  YoungAlbumFloatingButton({required this.controller});

  @override
  _YoungAlbumFloatingButtonState createState() => _YoungAlbumFloatingButtonState();
}

class _YoungAlbumFloatingButtonState extends State<YoungAlbumFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.controller.isPhoto?Container(
        width: 124.w,
        height: 45.h,
        child: _buildAddPhotoButton()):Container(
        width: 128.w,
        height: 45.h,
        child: _buildVideoPhotoButton()));
  }

  FloatingActionButton _buildAddPhotoButton() {
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
        label: Row(
          children: [
            Icon(
              Icons.add,
              size: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 2.w),
              child: ButtonText(
                "사진 올리기",
                wWhiteColor
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        foregroundColor: Colors.white,
        backgroundColor: wPurpleColor,
      );
  }

  FloatingActionButton _buildVideoPhotoButton() {
    return FloatingActionButton.extended(
      onPressed: () async{
        var pickVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            //AddPhotoView
            child: AddVideo( File(pickVideo!.path),),
          ),
        );
      },
      label: Row(
        children: [
          Icon(
            Icons.add,
            size: 20,
          ),
          Container(
            child: ButtonText(
              "동영상 올리기",
              wWhiteColor
            ),
          ),
        ],
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      backgroundColor: wPurpleColor,
    );
  }
}
