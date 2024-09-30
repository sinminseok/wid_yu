import 'package:get/get.dart';
import 'package:wid_yu/final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import 'package:wid_yu/young/album/main/api/YoungAlbumApi.dart';

class YoungAlbumController extends GetxController {
  RxBool _isPhoto = true.obs;
  RxBool _isVideo = false.obs;
  RxBool _isBigShow = true.obs;
  RxBool _isReadAlarm = true.obs;

  List<YoungRewardReadResponse> photos = [];
  List<YoungRewardReadResponse> videos = [];

  Future<bool> loadInit() async {
    photos = [];
    videos = [];
    List<YoungRewardReadResponse> response =
        await YoungAlbumApi().loadAllReward();

    for (int i = 0; i < response.length; i++) {
      if (response[i].type == "IMAGE") {
        photos.add(response[i]);
      } else {

        videos.add(response[i]);
      }
    }

    return true;
  }

  void checkReadAlarm() {
    _isReadAlarm.value = false;
  }

  void showPhotos() {
    _isPhoto.value = true;
    _isVideo.value = false;
  }

  void showVideos() {
    _isPhoto.value = false;
    _isVideo.value = true;
  }

  void checkBigShow() {
    _isBigShow.value = !_isBigShow.value;
  }

  bool get isPhoto => _isPhoto.value;

  bool get isVideo => _isVideo.value;

  bool get isBigShow => _isBigShow.value;

  bool get isReadAlarm => _isReadAlarm.value;
}
