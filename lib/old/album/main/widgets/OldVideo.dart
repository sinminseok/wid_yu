
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';

import '../../../../young/album/video-detail/view/YoungVideoView.dart';


class OldVideoWidget extends StatefulWidget {
  final YoungRewardReadResponse reward;

  OldVideoWidget(this.reward);

  @override
  _OldVideoWidgetState createState() => _OldVideoWidgetState();
}

class _OldVideoWidgetState extends State<OldVideoWidget> {
  Uint8List? _thumbnailBytes;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video:
      "https://widyu-bucket.s3.ap-northeast-2.amazonaws.com/test_trimmed%3AMay9%2C2024-20%3A50%3A27.mp4",
      imageFormat: ImageFormat.PNG,
      maxWidth: 100,
      quality: 50,
    );
    setState(() {
      _thumbnailBytes = uint8list!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // 비디오를 재생하는 화면으로 이동하는 로직을 여기에 추가
          Get.to(() => VideoPlayerScreen(widget.reward.url));
        },
        child: Stack(
          children: [
            Container(
              width: 156,
              height: 277,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: _thumbnailBytes != null
                  ? ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.memory(_thumbnailBytes!, fit: BoxFit.cover))
                  : Center(
                child: CircularProgressIndicator(),
              ),
            ),

          ],
        ));
  }
}
