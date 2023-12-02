import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';

class AddVideo extends StatefulWidget {
  File file;


  AddVideo(this.file);

  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {

  late VideoEditorController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoEditorController.file(
      widget.file,
      minDuration: const Duration(seconds: 1),
      maxDuration: const Duration(seconds: 10),
    );

    super.initState();
  }

  String formatter(Duration duration) => [
    duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
    duration.inSeconds.remainder(60).toString().padLeft(2, '0')
  ].join(":");

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return _buildTrimWidget();
  }

  Widget _buildTrimWidget() {
    return _controller.initialized
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CropGridViewer.preview(
                controller: _controller,
              ),
              AnimatedBuilder(
                animation: _controller.video,
                builder: (_, __) => AnimatedOpacity(
                  opacity: _controller.isPlaying ? 0 : 1,
                  duration: kThemeAnimationDuration,
                  child: GestureDetector(
                    onTap: _controller.video.play,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ..._trimSlider(),
      ],
    )
        : const Center(child: CircularProgressIndicator());
  }

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _controller.video,
        ]),
        builder: (_, __) {
          final int duration = _controller.videoDuration.inSeconds;
          final double pos = _controller.trimPosition * duration;

          return Container(
            child: Row(
              children: [
                Text(formatter(Duration(seconds: pos.toInt()))),
                const Expanded(child: SizedBox()),
                AnimatedOpacity(
                  opacity: _controller.isTrimming ? 1 : 0,
                  duration: kThemeAnimationDuration,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(formatter(_controller.startTrim)),
                      const SizedBox(width: 10),
                      Text(formatter(_controller.endTrim)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      Container(
        width: 330.w,
        margin: EdgeInsets.symmetric(vertical: 170.h),
        child: TrimSlider(
          controller: _controller,
          height: 200.h,
          horizontalMargin: 200.h,
          child: TrimTimeline(
            controller: _controller,
            padding: const EdgeInsets.only(top: 10),
          ),
        ),
      ),
    ];
  }
}
