import 'package:meta/meta.dart';

class GoalTimeEditRequest {
  int? goalStatusIdx;
   String time;
  int? pullNum;

  GoalTimeEditRequest({
    required this.goalStatusIdx,
    required this.time,
    required this.pullNum,
  });

  Map<String, dynamic> toJson() {
    return {
      'goalStatusIdx': goalStatusIdx,  // 누락된 필드 추가
      'time': time,
      'pillNum': pullNum,
    };
  }
}
