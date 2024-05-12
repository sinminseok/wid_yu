
class ResponseYoungImageRewardDto{
  String _description;
  String _imageUrl;
  //리워드를 만든 유저 이름
  String _userName;
  bool _isRead;

  ResponseYoungImageRewardDto(
      this._description, this._imageUrl, this._userName, this._isRead);
}