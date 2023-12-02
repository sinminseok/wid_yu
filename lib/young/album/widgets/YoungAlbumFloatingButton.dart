

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/album/controller/YoungAlbumController.dart';

import '../../../common/utils/Color.dart';
import '../detail-view/AddPhotoView.dart';
import '../detail-view/AddVideoView.dart';

class YoungAlbumFloatingButton extends StatefulWidget {
  final YoungAlbumController controller;


  YoungAlbumFloatingButton({required this.controller});

  @override
  _YoungAlbumFloatingButtonState createState() => _YoungAlbumFloatingButtonState();
}

class _YoungAlbumFloatingButtonState extends State<YoungAlbumFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.controller.isPhoto?_buildAddPhotoButton():_buildVideoPhotoButton());
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
      label: Container(
        child: Text(
          "비디오 올리기",
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
}
