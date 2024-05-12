
import 'package:wid_yu/common/dto/goal/GoalType.dart';

import 'GoalTimeResponse.dart';

class GoalResponse {
  final int _goalIdx;
  //final int _userIdx;
  final String _title;
  final String _description;
  final String _type;
  final String _day;
  final List<GoalTimeResponse> _times;

  GoalResponse({
    required int goalIdx,
    //required int userIdx,
    required String title,
    required String description,
    required String type,
    required String day,
    required List<GoalTimeResponse> times
  })  : _goalIdx = goalIdx,
        //_userIdx = userIdx,
        _title = title,
        _description = description,
        _type = type,
        _day = day,
        _times = times;

  factory GoalResponse.fromJson(Map<String, dynamic> json) {
    // JSON 데이터에서 필요한 값을 추출하여 객체 생성
    return GoalResponse(
      goalIdx: json['goalIdx'],
      //userIdx: json['userIdx'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      day: json['day'],
      times: (json['goalStatusDtoList'] as List).map((time) {
        // GoalTimeResponse 객체 생성
        return GoalTimeResponse.fromJson(time);
      }).toList(),
    );
  }


  String get day => _day;

  String get type => _type;

  String get description => _description;

  String get title => _title;

  //int get userIdx => _userIdx;

  int get goalIdx => _goalIdx;

  List<GoalTimeResponse> get times => _times;

  List<String> filterDays() {
    List<String> daysOfWeek = ['월', '화', '수', '목', '금', '토', '일'];
    List<String> activeDays = [];

    // 문자열에서 1로 된 부분을 찾아 해당하는 요일을 activeDays 리스트에 추가합니다.
    for (int i = 0; i < day.length; i++) {
      if (day[i] == '1') {
        activeDays.add(daysOfWeek[i]);
      }
    }

    return activeDays.reversed.toList();;
  }

}

GoalResponse goal1 = GoalResponse(goalIdx: 1,title: '강아지산책', description: 'ㅁㄴㅇ', type: GoalType.MEDICATION.toString(), day: '0011101', times: [goalTime1, goalTime2, goalTime3, goalTime4]);

