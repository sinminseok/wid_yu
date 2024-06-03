import '../../../common-dto/response/goal/GoalResponse.dart';
import 'OldResponseByYoung.dart';

class YoungMainGoalResponse {
  int? _userIdx;
  String? _name;
  String? _profileImageUrl;
  String? _userType;
  double? _percentage;
  List<GoalResponse>? _goalsAndStatus;
  List<OldResponseByYoung>? _seniorsGoalList;

  YoungMainGoalResponse(
      {required int? userIdx,
      required String? name,
      required String? profileImageUrl,
      required String? userType,
      required double? percentage,
      required List<GoalResponse>? goalsAndStatus,
      required List<OldResponseByYoung>? seniorsGoalList})
      : _userIdx = userIdx,
        _name = name,
        _profileImageUrl = profileImageUrl,
        _userType = userType,
        _percentage = percentage,
        _goalsAndStatus = goalsAndStatus,
        _seniorsGoalList = seniorsGoalList;

  void setSeniorsGoalList(List<OldResponseByYoung> value){
    _seniorsGoalList = value;
  }

  factory YoungMainGoalResponse.fromJson(Map<String, dynamic> json) {
    List<GoalResponse>? goalsAndStatus = [];
    if (json['goals'] != null) {
      goalsAndStatus = List<GoalResponse>.from(json['goals'].map((x) => GoalResponse.fromJson(x)));
    }


    List<OldResponseByYoung>? seniorsGoalList = [];
    if (json['seniorsGoalList'] != null) {
      seniorsGoalList = List<OldResponseByYoung>.from(json['seniorsGoalList'].map((x) => OldResponseByYoung.fromJson(x)));
    }


    return YoungMainGoalResponse(
      userIdx: json['userIdx'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      userType: json['userType'],
      percentage: json['percentage'],
      goalsAndStatus: goalsAndStatus,
      seniorsGoalList: seniorsGoalList,
    );
  }

  List<GoalResponse>? get goalsAndStatus => _goalsAndStatus;


  List<OldResponseByYoung>? get seniorsGoalList => _seniorsGoalList;

  double? get percentage => _percentage;

  String? get userType => _userType;

  String? get profileImageUrl => _profileImageUrl;

  String? get name => _name;

  int? get userIdx => _userIdx;
}

YoungMainGoalResponse currentUser = YoungMainGoalResponse(

    userIdx: 3,
    name: '민석',
    profileImageUrl: null,
    userType: null,
    percentage: 0.5,
    goalsAndStatus: [], seniorsGoalList: []);


YoungMainGoalResponse initCurrent = YoungMainGoalResponse(

    userIdx: 3,
    name: 'init',
    profileImageUrl: null,
    userType: null,
    percentage: 0.0,
    goalsAndStatus: [], seniorsGoalList: []);
