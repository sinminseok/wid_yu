
class FindIdResponseDto{
  String _id;
  String _name;
  String _phoneNumber;

  FindIdResponseDto(this._id, this._name, this._phoneNumber);

  // JSON 데이터를 객체로 변환하는 메서드
  factory FindIdResponseDto.fromJson(Map<String, dynamic> json) {
    return FindIdResponseDto(
      json['id'] as String,
      json['name'] as String,
      json['phoneNumber'] as String,
    );
  }

  String get phoneNumber => _phoneNumber;

  String get name => _name;

  String get id => _id;
}