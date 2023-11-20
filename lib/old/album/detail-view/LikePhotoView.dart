import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/old/album/widgets/OldPhotoWidget.dart';

class LikePhotoView extends StatefulWidget {
  const LikePhotoView({Key? key}) : super(key: key);

  @override
  _LikePhotoViewState createState() => _LikePhotoViewState();
}

class _LikePhotoViewState extends State<LikePhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '좋아하는 사진',
        color: wOrangeBackGroundColor,
      ),
      backgroundColor: wOrangeBackGroundColor,
      body: SingleChildScrollView(

        child: Container(
          height: 780.h,
          width: 360.w,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext ctx, int idx) {
                return OldPhotoWidget();
              }),
        ),
      ),
    );
  }
}
