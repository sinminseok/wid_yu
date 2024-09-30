import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wid_yu/old/health-information/api/OldHealthApi.dart';
import 'package:wid_yu/final-dto/old-dto/response/OldHealthResponse.dart';
import 'package:wid_yu/old/health-information/popup/HealthInformationPopup.dart';
import 'package:wid_yu/young/health-infroamtion/dto/HealthAllResponse.dart';
import 'package:workmanager/workmanager.dart';

class OldHealthInformationController extends GetxController {
  OldHealthResponse? _healthResponse;
  static const String sendPositionTask = 'sendPositionTask';



  void initializeWorkManager() {
    // WorkManager 초기화
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);


    // 주기적으로 위치 정보를 전송하는 작업을 5분마다 등록
    Workmanager().registerPeriodicTask(
      '1', // 고유 작업 ID
      sendPositionTask, // 작업 이름
      frequency: Duration(minutes: 5), // 5분마다 실행
    );
  }

  // 백그라운드에서 실행될 콜백 함수
  static void callbackDispatcher() {

    Workmanager().executeTask((task, inputData) async {
      if (task == sendPositionTask) {
        // 위치 정보를 주기적으로 전송
        await sendPositionData();
      }
      return Future.value(true);
    });
  }

  // 위치 정보를 가져와 서버에 전송하는 메소드
  static Future<void> sendPositionData() async {
    Position? position = await _getCurrentPosition();
    if (position != null) {
      await OldHealthApi().sendPositionInit(position.latitude, position.longitude);
    }
  }

  Future<bool> loadInit(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 사용자에게 위치 서비스 활성화를 요청하는 로직 추가
      await Geolocator.openLocationSettings();  // 위치 설정 창으로 이동
    }
    Position? position = await _getCurrentPosition();
    if (position != null) {
      // 위치 정보를 활용한 추가 로직을 여기에 작성하세요.
      await OldHealthApi().sendPositionInit(position!.latitude, position.longitude);
    }else{

    }

    _healthResponse = await OldHealthApi().loadMainPage();

    initializeWorkManager();
    if (_healthResponse != null) {
      showDangerous(_healthResponse!.state, _healthResponse!.heartBit, _healthResponse!.userIdx, context);
      return true;
    }
    return false;
  }


  // 현재 위치 정보를 가져오는 메소드
  static Future<Position?> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // 위치 권한이 부여되었으면, 현재 위치를 반환합니다.
    return await Geolocator.getCurrentPosition();
  }

  void showDangerous(int state, double value, int userIdx, BuildContext context) async {
    HealthAllResponse? healthAllResponse = await OldHealthApi().loadDetailInformation(userIdx);

    if ((value <= 50 || value >= 130) && state == 1) {
      HealthInformationPopup().createGoalPopup(healthAllResponse!, context);
    }
  }

  OldHealthResponse get healthResponse => _healthResponse!;
}
