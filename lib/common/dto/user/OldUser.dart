//
// import 'package:wid_yu/common/dto/disease/Disease.dart';
// import 'package:wid_yu/common/dto/health/Health.dart';
// import 'package:wid_yu/common/dto/user/User.dart';
// import 'package:wid_yu/common/dto/user/UserType.dart';
//
// import '../../../final-dto/common-dto/response/user/UserType.dart';
// import '../goal/Goal.dart';
//
// class OldUser extends User{
//   String? _inviteCode;
//   bool? _hasDisease;
//   int? _totalPoint;
//   Health? _health;
//   bool? _isConnect;
//   Disease? _disease;
//
//
// // 빈 생성자 추가
//   OldUser.empty(this._inviteCode, this._hasDisease, this._totalPoint, this._health, this._isConnect) : super("이름", "번호", "생일", "주소", UserType.SENIOR, []);
//
//   OldUser(String name, String phoneNumber, String birth, String address, UserType userType, List<Goal> goals, this._inviteCode, this._hasDisease, this._totalPoint, this._health, this._isConnect)
//       : super(name, phoneNumber, birth, address, userType, goals);
//
//
//   bool? get isConnect => _isConnect;
//
//
//   Disease? get disease => _disease;
//
//   Health? get health => _health;
//
//   int? get totalPoint => _totalPoint;
//
//   bool? get hasDisease => _hasDisease;
//
//   String? get inviteCode => _inviteCode;
// }