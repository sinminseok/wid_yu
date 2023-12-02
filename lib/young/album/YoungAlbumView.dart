import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/album/controller/YoungAlbumController.dart';
import 'package:wid_yu/young/album/wid/YoungPhotoWidget.dart';
import 'package:wid_yu/young/album/widgets/Album.dart';
import 'package:wid_yu/young/album/widgets/AllRead.dart';
import 'package:wid_yu/young/album/widgets/SelectAlbumType.dart';
import 'package:wid_yu/young/album/widgets/YoungAlbumFloatingButton.dart';

import '../../common/utils/Color.dart';
import '../../common/utils/FilePath.dart';
import 'detail-view/AddPhotoView.dart';

class YoungAlbumView extends StatefulWidget {
  const YoungAlbumView({Key? key}) : super(key: key);

  @override
  _YoungAlbumViewState createState() => _YoungAlbumViewState();
}

class _YoungAlbumViewState extends State<YoungAlbumView> {

  YoungAlbumController controller = YoungAlbumController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: YoungAlbumFloatingButton(controller: controller),
      backgroundColor: wPurpleBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectAlbumType(controller),
            AllRead(controller),
            Album(controller)
          ],
        ),
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
