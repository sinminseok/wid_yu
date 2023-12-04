import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/album/detail-view/video/Preview.dart';

class AddVideo extends StatefulWidget {
  final File file;

  const AddVideo(this.file, {Key? key}) : super(key: key);

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  final Trimmer _trimmer = Trimmer();

  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  void _loadVideo() {
    _trimmer.loadVideo(videoFile: widget.file);
  }

  _saveVideo() async {

    await _trimmer.saveTrimmedVideo(
      startValue: _startValue,
      endValue: _endValue,
      ffmpegCommand: '-c:a aac -c:v copy',
      customVideoFormat: '.mp4',
      onSave: (String? value) {
        setState(() {
          if (value != null) {
            Get.to(() => VideoPreview(value));
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: wTextBlackColor,
        appBar: AppBar(
          elevation: 0,
            automaticallyImplyLeading:false,
          backgroundColor: wTextBlackColor,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: wGrey300Color,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text("Cancel", style: TextStyle(
                          color: wTextBlackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                Container(
                  width: 70.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: InkWell(
                    onTap: (){
                      _saveVideo();
                    },
                    child: Center(
                      child: Text("Done", style: TextStyle(
                          color: wTextBlackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          )

        ),
        body: Center(
          child: SingleChildScrollView(
            child:Container(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  Container(
                    width: 300.w,
                    height: 390.h,
                    margin: EdgeInsets.only(top: 30.h),
                    child: VideoViewer(

                        trimmer: _trimmer),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.w,
                          height: 60.h,
                          margin: EdgeInsets.only(right: 3.w, top: 20.h),
                          decoration: BoxDecoration(
                            color: wGrey600Color,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              topLeft: Radius.circular(6),
                            )
                          ),
                          child:      Center(
                            child: TextButton(
                              child: _isPlaying
                                  ? const Icon(
                                Icons.pause,
                                size: 30.0,
                                color: Colors.white,
                              )
                                  : const Icon(
                                Icons.play_arrow,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                bool playbackState = await _trimmer.videoPlaybackControl(
                                  startValue: _startValue,
                                  endValue: _endValue,
                                );
                                setState(() => _isPlaying = playbackState);
                              },
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              decoration: BoxDecoration(
                                  color: wGrey600Color,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  )
                              ),
                              width: 290.w,
                              height: 60.h,
                            ),
                            Positioned(
                              left: 12.w,
                              child: TrimViewer(
                                trimmer: _trimmer,
                                viewerHeight: 50.h,
                                viewerWidth: 270.w,
                                durationStyle: DurationStyle.FORMAT_MM_SS,
                                maxVideoLength: const Duration(seconds: 59),
                                editorProperties: TrimEditorProperties(
                                  borderPaintColor: wGrey300Color,
                                  borderWidth: 4,
                                  borderRadius: 5,
                                  circlePaintColor: wGrey500Color,
                                ),
                                areaProperties: TrimAreaProperties.edgeBlur(
                                  thumbnailQuality: 10,
                                ),
                                onChangeStart: (value) => _startValue = value,
                                onChangeEnd: (value) => _endValue = value,
                                onChangePlaybackState: (value) =>
                                    setState(() => _isPlaying = value),
                              ),
                            ),
                          ],
                        )


                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
