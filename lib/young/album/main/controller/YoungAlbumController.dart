
import 'package:get/get.dart';

class YoungAlbumController extends GetxController {
  RxBool _isPhoto = true.obs;
  RxBool _isVideo = false.obs;
  RxBool _isBigShow = true.obs;
  RxBool _isReadAlarm = true.obs;

  void checkReadAlarm() {
    _isReadAlarm.value = false;
  }

  void showPhotos(){
    _isPhoto.value = true;
    _isVideo.value = false;
  }

  void showVideos(){
    _isPhoto.value = false;
    _isVideo.value = true;
  }

  void checkBigShow(){
    _isBigShow.value = !_isBigShow.value;
  }

  bool get isPhoto=> _isPhoto.value;
  bool get isVideo => _isVideo.value;
  bool get isBigShow => _isBigShow.value;
  bool get isReadAlarm => _isReadAlarm.value;

}