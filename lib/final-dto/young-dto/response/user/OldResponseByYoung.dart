import '../../../common-dto/response/goal/GoalResponse.dart';

/**
 * 부양자 메인화면에서 사용할 시니어 dto
 */
class OldResponseByYoung{
  String? _name;
  String? _profile;
  String? _userType;
  int? _oldIndex;
  double? _percentage;
  int? _point;
  List<GoalResponse>? _goalsAndStatus;

  OldResponseByYoung({
    required String? name,
    required String? profile,
    required String? userType,
    required int? oldIndex,
    required double? percentage,
    required int? point,
    required List<GoalResponse>? goalsAndStatus,
  })  : _name = name,
        _profile = profile,
        _userType = userType,
        _oldIndex = oldIndex,
        _point = point,
  _percentage = percentage,
        _goalsAndStatus = goalsAndStatus;

  factory OldResponseByYoung.fromJson(Map<String, dynamic> json) {
    List<GoalResponse>? goalsAndStatus = [];
    if (json['goalsAndStatus'] != null) {
      goalsAndStatus = List<GoalResponse>.from(json['goalsAndStatus'].map((x) => GoalResponse.fromJson(x)));
    }
    return OldResponseByYoung(
      name: json['name'],
      profile: json['profile'],

      userType: json['userType'],
      percentage : json['percentage'],
      oldIndex: json['oldIndex'],
      point: json['point'],
      goalsAndStatus: goalsAndStatus,
    );
  }

  List<GoalResponse>? get goalsAndStatus => _goalsAndStatus;

  int? get point => _point;

  int? get oldIndex => _oldIndex;

  String? get userType => _userType;

  String? get profile => _profile;

  String? get name => _name;

  double? get percentage => _percentage;


}

OldResponseByYoung old = OldResponseByYoung(name: "할머니", profile: null, userType: "SENIOR", oldIndex: 2, point: 40, goalsAndStatus: [goal1], percentage: 0.4);