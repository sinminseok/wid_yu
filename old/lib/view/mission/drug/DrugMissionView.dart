import 'dart:ui';

import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // 카메라 컨트롤러 초기화
    _controller = CameraController(
      CameraDescription(
        name: "0",  // 기기에서 사용 가능한 카메라의 ID (0부터 시작)
        lensDirection: CameraLensDirection.back,  // 후면 카메라 사용
        sensorOrientation: 0,  // 이 부분에서 sensorOrientation 값을 설정해 주세요.
      ),
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '', color: wOrange200Color,),
      body: Center(
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.center,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // 카메라가 초기화되면 카메라 화면을 보여줍니다.
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // 흐림 효과 정도 조절
                    child: CameraPreview(_controller),
                  );
                } else {
                  // 카메라 초기화 중에는 로딩 표시를 보여줍니다.
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          try {
            // 사진 찍기
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            // 이미지 찍은 후에 여기에서 필요한 동작을 수행할 수 있습니다.
          } catch (e) {
            print('에러 발생: $e');
          }
        },
      ),
    );
  }
}
