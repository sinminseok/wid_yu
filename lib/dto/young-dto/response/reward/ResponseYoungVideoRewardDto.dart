
class ResponseYoungVideoRewardDto{
  String _videoUrl;
  //리워드를 만든 유저 이름
  String _userName;
  bool _isRead;

  ResponseYoungVideoRewardDto(this._videoUrl, this._userName, this._isRead);
}