
// 리워드 생성 DTO
import 'package:camera/camera.dart';

class YoungRewardGeneratorRequest {

   int? _userIdx;
   String? _url;
   String? _description;

   YoungRewardGeneratorRequest({
     required int? userIdx,
     required String? url,
     required String? description,
   }) : _userIdx = userIdx,
         _url = url,
         _description = description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userIdx'] = this._userIdx;
    data['url'] = this._url;
    data['description'] = this._description;
    return data;
  }

  int? get userIdx => _userIdx;

   String? get url => _url;

  String? get description => _description;

//YoungRewardGeneratorRequest(this._url, this.userIdx, this._description);


}