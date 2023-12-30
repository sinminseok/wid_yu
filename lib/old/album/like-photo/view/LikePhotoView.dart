

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/old/album/like-photo/controller/LikePhotoController.dart';
import 'package:wid_yu/old/album/widgets/OldPhotoWidget.dart';

class LikePhotoView extends StatelessWidget {
  const LikePhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LikePhotoController controller = LikePhotoController();

    return Scaffold(
      backgroundColor: wOrangeBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: "좋아하는 사진",color: wOrangeBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OldPhotoWidget()

          ],
        ),
      ),
    );
  }
}
