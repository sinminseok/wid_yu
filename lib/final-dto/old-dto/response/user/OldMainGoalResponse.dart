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
    return OldMainGoalResponse(
      userIdx: json['userIdx'] as int?,
      name: json['name'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      userType: json['userType'] as String?,
      percentage: (json['percentage'] as num).toDouble(),
      point: json['point'] as int?,
      goalsAndStatus: (json['goals'] as List)
          .map((goal) => GoalResponse.fromJson(goal as Map<String, dynamic>))
          .toList(),


    );
  }

  int? get userIdx => _userIdx;
  String? get name => _name;
  String? get profileImageUrl => _profileImageUrl;
  String? get userType => _userType;
  double get percentage => _percentage;
  int? get point => _point;
  List<GoalResponse>? get goalsAndStatus => _goalsAndStatus;
}
