
/*
부모님이 구매한 사진 리워드 정보를 담을 DTO
 */
class ResponseOldImageRewardDto{
  String _description;
  String _imageUrl;
  //리워드를 만든 유저 이름
  String _userName;
  //좋아요를 눌렀는지 안 눌렀는지 확인하는 필드
  bool _favorite;

  ResponseOldImageRewardDto(
      this._description, this._imageUrl, this._userName, this._favorite);
}