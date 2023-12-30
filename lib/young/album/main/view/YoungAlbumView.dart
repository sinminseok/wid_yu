import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/young/album/main/controller/YoungAlbumController.dart';
import 'package:wid_yu/young/album/main/widgets/Album.dart';
import 'package:wid_yu/young/album/main/widgets/AllRead.dart';
import 'package:wid_yu/young/album/main/widgets/SelectAlbumType.dart';
import 'package:wid_yu/young/album/main/widgets/YoungAlbumFloatingButton.dart';

import '../../../../common/utils/Color.dart';
import '../../add-photo/view/AddPhotoView.dart';

class YoungAlbumView extends StatefulWidget {
  const YoungAlbumView({Key? key}) : super(key: key);

  @override
  _YoungAlbumViewState createState() => _YoungAlbumViewState();
}

class _YoungAlbumViewState extends State<YoungAlbumView> {

  YoungAlbumController controller = YoungAlbumController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: _buildAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: YoungAlbumFloatingButton(controller: controller),
        backgroundColor: wPurpleBackGroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectAlbumType(controller),
              //AllRead(controller),
              Album(controller),
              Container(
                height: 60.h,
              )
            ],
          ),
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 47.w,
            height: 21.6.h,
            margin: EdgeInsets.only(top: 10.h, left: 13.w),
            child: Image.asset("assets/common/common/appbar_logo.png"),
          ),

        ],
      ),
    );
  }
}
