
import 'RequestOldDiseaseDto.dart';

class RequestOldInformationDto{
  String? _name;
  int? _brith;
  int? _phoneNumber;
  //도로명
  String? _address;
  int? _idDisease;
  //만약 _hasDisease 가 false이면 _disease에 빈 값을 넣어 요청
  List<RequestOldDiseaseDto>? _disease;

  RequestOldInformationDto(this._name, this._brith, this._phoneNumber,
      this._address, this._idDisease, this._disease);
}