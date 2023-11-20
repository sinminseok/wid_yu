
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../widgets/MosaicPhotoWidget.dart';
import '../widgets/PointWidget.dart';

class CollectPhotoView extends StatefulWidget {
  const CollectPhotoView({Key? key}) : super(key: key);

  @override
  _CollectPhotoViewState createState() => _CollectPhotoViewState();
}

class _CollectPhotoViewState extends State<CollectPhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wOrangeBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '새로운 사진 모으기', color: wOrangeBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCurrentPoint(),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              height: 400.h,
              child:ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return MosaicPhotoWidget();
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPoint() {
    return PointWidget();
  }
}
