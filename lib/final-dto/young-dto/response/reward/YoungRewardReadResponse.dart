import 'package:image_picker/image_picker.dart';

class YoungRewardReadResponse {
  final int _rewardIdx;
  final int _userIdx;
  final int _status;
  final String _type;
  final String _description;
  final String _url;
  final int _point;

  YoungRewardReadResponse({
    required int rewardIdx,
    required int userIdx,
    required String description,
    required int status,
    required String type,
    required String url,
    required int point,
  })  : _rewardIdx = rewardIdx,
        _userIdx = userIdx,
        _status = status,
  _description = description,
        _type = type,
        _url = url,
        _point = point;

  // JSON 데이터를 이용하여 객체 생성
  factory YoungRewardReadResponse.fromJson(Map<String, dynamic> json) {
    return YoungRewardReadResponse(
      rewardIdx: json['rewardIdx'] as int,
      userIdx: json['userIdx'] as int,
      status: json['status'] as int,
      url: json['url'] as String,
      point: json['point'] as int,
      type: json['type'], description: json['description'],
    );
  }

  int get point => _point;

  String get url => _url;

  int get status => _status;

  int get userIdx => _userIdx;


  String get description => _description;

  String get type => _type;

  int get rewardIdx => _rewardIdx;
}
