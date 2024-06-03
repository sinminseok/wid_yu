class YoungRewardReadResponse {
  int? _rewardIdx;
  int? _userIdx;
  String? _uploaderName;
  String? _uploaderImageUrl;
  int? _status;
  String? _type;
  String? _description;
  String? _url;
  int? _point;

  YoungRewardReadResponse({
    required int rewardIdx,
    required int userIdx,
    required String uploaderName,
    required String? uploaderImageUrl, // nullable
    required int status,
    required String type,
    required String description,
    required String? url, // nullable로 변경
    required int point,
  })  : _rewardIdx = rewardIdx,
        _userIdx = userIdx,
        _uploaderName = uploaderName,
        _uploaderImageUrl = uploaderImageUrl,
        _status = status,
        _type = type,
        _description = description,
        _url = url,
        _point = point;

  factory YoungRewardReadResponse.fromJson(Map<String, dynamic> json) {
    print("Parsing JSON: $json");
    return YoungRewardReadResponse(
      rewardIdx: json['rewardIdx'] as int,
      userIdx: json['uploaderIdx'] as int,  // 여기서 uploaderIdx 키를 사용
      uploaderName: json['uploaderName'] as String,
      uploaderImageUrl: json['uploaderImageUrl'] as String?, // nullable
      status: json['status'] as int,
      type: json['type'] as String,
      description: json['description'] as String,
      url: json['url'] as String?, // nullable로 변경
      point: json['point'] as int,
    );
  }

  int? get rewardIdx => _rewardIdx;
  int? get userIdx => _userIdx;
  String? get uploaderName => _uploaderName;
  String? get uploaderImageUrl => _uploaderImageUrl;
  int? get status => _status;
  String? get type => _type;
  String? get description => _description;
  String? get url => _url;
  int? get point => _point;
}
