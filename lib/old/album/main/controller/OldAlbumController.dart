
import 'package:get/get.dart';

class OldAlbumController extends GetxController {
  RxBool _isPhoto = true.obs;
  RxBool _isVideo = false.obs;
  RxBool _isBigShow = true.obs;

  void selectPhoto() {
    _isPhoto.value = true;
    _isVideo.value = false;
  }

  void selectVideo() {
    _isPhoto.value = false;
    _isVideo.value = true;
  }

  void clickBigShow(){
    _isBigShow.value = !_isBigShow.value;
  }

  bool get isPhoto => _isPhoto.value;

  bool get isVideo => _isVideo.value;

  bool get isBigShow => _isBigShow.value;
}