import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/old/album/main/controller/OldAlbumController.dart';
import 'package:wid_yu/old/album/main/widgets/OldAlbumAppBar.dart';
import 'package:wid_yu/old/album/main/widgets/OldAlbumFloatingButton.dart';
import 'package:wid_yu/old/album/main/widgets/OldPhotos.dart';
import 'package:wid_yu/old/album/main/widgets/OldVideo.dart';
import 'package:wid_yu/old/album/main/widgets/SelectRewardType.dart';

import '../../../../common/utils/Color.dart';
import '../../../../young/album/main/widgets/PointWidget.dart';
import '../../collect-new-photo/view/CollectPhotoView.dart';

class OldAlbumView extends StatefulWidget {
  @override
  _OldAlbumViewState createState() => _OldAlbumViewState();
}

class _OldAlbumViewState extends State<OldAlbumView> {
  OldAlbumController controller = OldAlbumController();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: FutureBuilder(
          future: controller.loadInit(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return Scaffold(
                appBar: OldAlbumAppBar(controller),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endContained,
                floatingActionButton: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
                        child: OldAlbumFloatingButton(controller)),
                  ],
                ),
                backgroundColor: wOrangeBackGroundColor,
                body: SingleChildScrollView(
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // InkWell(
                            //     onTap: () {
                            //       controller.loadInit();
                            //     },
                            //     child: _buildMainText()),
                            PointWidget(controller.point!),
                            SelectRewardType(controller),

                            controller.isVideo
                                ? _buildVideo()
                                : OldPhotos(controller)
                          ],
                        ))),
              );
            }
          },
        ));
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Title2Text("가족들의 소식이 궁금하세요?", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.h),
            child: Body1Text("목표 달성으로 쌓은 포인트로 구매해서 볼 수 있어요.", kTextBlackColor),
          ),
        ],
      ),
    );
  }


  Widget _buildVideo() {
    return Center(
      child: Container(
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return OldVideoWidget(controller.buyVideos[1]);
            },
          ),
        ),
      ),
    );
  }
}
