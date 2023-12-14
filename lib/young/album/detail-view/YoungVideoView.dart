
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../../../common/utils/Color.dart';
import '../../frame/YoungFrameView.dart';

class YoungVideoView extends StatefulWidget {
  String outputVideoPath;


  YoungVideoView(this.outputVideoPath);

  @override
  _YoungVideoViewState createState() => _YoungVideoViewState();
}

class _YoungVideoViewState extends State<YoungVideoView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.outputVideoPath!))
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // 여기서 재생 시작
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 360.w,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 360.w,
                height: 40.h,
                margin: EdgeInsets.only(top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: Icon(Icons.arrow_back_ios_sharp),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.w),
                      child: Text(
                        "동영상 올리기",
                        style: TextStyle(
                            color: wTextBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('동영상이 업로드 됐습니다.'),
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: '확인',
                      onPressed: () {},
                    ),
                  ));
                  Get.offAll(() => YoungFrameView(1));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  width: 335.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: wPurple200Color),
                      color: wPurpleColor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Center(
                    child: Text(
                      "저장하기",
                      style: TextStyle(
                          color: wWhiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
