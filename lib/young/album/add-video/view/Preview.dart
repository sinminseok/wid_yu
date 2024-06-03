import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/album/add-photo/api/AddPhotoApi.dart';
import 'package:wid_yu/final-dto/young-dto/request/reward/YoungRewardGeneratorRequest.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';

class VideoPreview extends StatefulWidget {
  final String? outputVideoPath;

  const VideoPreview(this.outputVideoPath, {Key? key}) : super(key: key);

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _controller;
  bool _isLoading = false; // 로딩 상태를 관리하기 위한 변수

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

  // 저장하기 버튼을 눌렀을 때의 로직
  Future<void> _saveVideo() async {
    setState(() {
      _isLoading = true; // 로딩 상태를 true로 변경하여 화면에 로딩을 표시
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var userIdx = await prefs.getInt("user_idx");
    var youngRewardGeneratorRequest =
    YoungRewardGeneratorRequest(userIdx: userIdx, url: widget.outputVideoPath, description: "");

    //YoungRewardGeneratorRequest
    bool response =
    await AddPhotoApi().createPhotoReward(youngRewardGeneratorRequest, "VIDEO");
    if(response == true){
      setState(() {
        _isLoading = false; // 로딩 상태를 false로 변경하여 화면에 로딩을 숨김
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('동영상이 업로드 됐습니다.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: '확인',
          onPressed: () {},
        ),
      ));
      Get.offAll(() => YoungFrameView(1));
    }

    // 동영상이 저장되었다면 해당 화면으로 이동하는 코드
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('동영상이 업로드 됐습니다.'),
    //   duration: Duration(seconds: 3),
    //   action: SnackBarAction(
    //     label: '확인',
    //     onPressed: () {},
    //   ),
    // ));
    // Get.offAll(() => YoungFrameView(1));
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
          // 로딩 상태일 때 화면 전체를 덮는 로딩 위젯
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
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
              _isLoading == false?InkWell(
                onTap: _saveVideo, // 저장하기 버튼 클릭 시 _saveVideo 함수 호출
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
              ):Container(
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
            ],
          )
        ],
      ),
    );
  }
}
