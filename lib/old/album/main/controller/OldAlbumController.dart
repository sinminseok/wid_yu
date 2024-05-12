import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/old/album/main/api/OldAlbumApi.dart';

import '../../../../final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import '../../../../young/album/main/api/YoungAlbumApi.dart';

class OldAlbumController extends GetxController {
  int? _point;

  List<YoungRewardReadResponse> _buyPhotos = [];
  List<YoungRewardReadResponse> _buyVideos = [];
  List<YoungRewardReadResponse> _lockRewards = [];

  RxBool _isPhoto = true.obs;
  RxBool _isVideo = false.obs;
  RxBool _isBigShow = true.obs;

  Future<bool> loadInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<YoungRewardReadResponse> list = await OldAlbumApi().loadAllReward();

    for (int i = 0; i < list.length; i++) {
      if (list[i].status == 0) {
        _lockRewards.add(list[i]);
        _buyVideos.add(list[i]);
      } else {
        if (list[i].type == "IMAGE") {
          _buyPhotos.add(list[i]);
        } else {
          _buyVideos.add(list[i]);
        }
      }
    }

    _point = prefs.getInt("point");

    return true;
  }

  void selectPhoto() {
    _isPhoto.value = true;
    _isVideo.value = false;
  }

  void selectVideo() {
    _isPhoto.value = false;
    _isVideo.value = true;
  }

  void clickBigShow() {
    _isBigShow.value = !_isBigShow.value;
  }

  bool get isPhoto => _isPhoto.value;

  bool get isVideo => _isVideo.value;

  bool get isBigShow => _isBigShow.value;

  List<YoungRewardReadResponse> get lockRewards => _lockRewards;

  List<YoungRewardReadResponse> get buyVideos => _buyVideos;

  List<YoungRewardReadResponse> get buyPhotos => _buyPhotos;

  int? get point => _point;
}
