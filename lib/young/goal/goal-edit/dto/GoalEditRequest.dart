

import '../../../../final-dto/common-dto/request/goal/GoalTimeGeneratorRequest.dart';
import 'GoalTimeEditRequest.dart';

class GoalEditRequest {
  int? userIdx;
  String? title;
  int? goalIdx;
  String? description;
  String? type;
  String? day;
  List<GoalTimeEditRequest>? goalStatusList;

  GoalEditRequest({
    required this.goalIdx,
    required this.userIdx,
    required this.title,
    required this.description,
    required this.type,
    required this.day,
    required this.goalStatusList,
  });

  Map<String, dynamic> toJson() {

    return {
      'userIdx': userIdx,
      'goalIdx' : goalIdx,
      'title': title,
      'description': description,
      'type': type,
      'day': day,
      'goalStatusList': goalStatusList?.map((goalTime) => goalTime.toJson()).toList(),
    };
  }
}

