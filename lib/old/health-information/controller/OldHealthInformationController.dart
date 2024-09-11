import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wid_yu/old/health-information/api/OldHealthApi.dart';
import 'package:wid_yu/old/health-information/dto/OldHealthResponse.dart';
import 'package:wid_yu/old/health-information/popup/HealthInformationPopup.dart';
import 'package:wid_yu/young/health-infroamtion/dto/HealthAllResponse.dart';

class OldHealthInformationController extends GetxController {
  OldHealthResponse? _healthResponse;

  Future<bool> loadInit(BuildContext context) async {
    //todo
    Position? position = await _getCurrentPosition();
    if (position != null) {
      print("Current position: ${position.latitude}, ${position.longitude}");
      // 위치 정보를 활용한 추가 로직을 여기에 작성하세요.
      await OldHealthApi().sendPositionInit(position!.latitude, position.longitude);
    }else{

    }

    _healthResponse = await OldHealthApi().loadMainPage();

    if (_healthResponse != null) {
      showDangerous(_healthResponse!.state, _healthResponse!.heartBit, _healthResponse!.userIdx, context);
      return true;
    }
    return false;
  }

  Future<Position?> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화 상태이면, 사용자에게 위치 서비스를 활성화하도록 요청합니다.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 위치 권한이 거부되었으면, 오류를 반환합니다.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 위치 권한이 영구적으로 거부되었으면, 오류를 반환합니다.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
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
