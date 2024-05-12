
// 구매하지 않은 사진 리워드 정보를 담을 DTO
class ResponseLockImageDto{
  //UI에 사진과 정보를 모자이크 처리해서 흐릿하게 보여줘야해서 아래 정보를 모두 보내주세요
  String _imageUrl;
  String _description;
  int _point;

  ResponseLockImageDto(this._imageUrl, this._description, this._point);
}