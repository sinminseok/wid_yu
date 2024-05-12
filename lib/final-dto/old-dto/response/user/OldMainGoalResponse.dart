import '../../../common-dto/response/goal/GoalResponse.dart';

class OldMainGoalResponse {
  int? _userIdx;
  String? _name;
  String? _profileImageUrl;
  String? _userType;
  double _percentage;
  int? _point;
  List<GoalResponse>? _goalsAndStatus;

  OldMainGoalResponse({
    required int? userIdx,
    required String? name,
    required String? profileImageUrl,
    required String? userType,
    required double percentage,
    required int? point,
    required List<GoalResponse>? goalsAndStatus,
  })  : _userIdx = userIdx,
        _name = name,
        _profileImageUrl = profileImageUrl,
        _userType = userType,
        _percentage = percentage,
        _point = point,
        _goalsAndStatus = goalsAndStatus;

  factory OldMainGoalResponse.fromJson(Map<String, dynamic> json) {
    // JSON 데이터에서 필요한 값을 추출하여 객체 생성
    return OldMainGoalResponse(
      userIdx: json['oldIndex'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      userType: json['userType'],
      percentage: json['percentage'],
      point: json['point'],
      goalsAndStatus: (json['goalsAndStatus'] as List).map((goal) {
        // GoalResponse 객체 생성
        return GoalResponse.fromJson(goal);
      }).toList(),
    );
  }

  List<GoalResponse>? get goalsAndStatus => _goalsAndStatus;

  int? get point => _point;

  double get percentage => _percentage;

  String? get userType => _userType;

  String? get profileImageUrl => _profileImageUrl;

  String? get name => _name;

  int? get userIdx => _userIdx;
}
