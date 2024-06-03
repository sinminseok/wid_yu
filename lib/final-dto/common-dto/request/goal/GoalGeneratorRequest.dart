
import 'GoalTimeGeneratorRequest.dart';

class GoalGeneratorRequest {
   int? userIdx;
   String? title;
   String? description;
   String? type;
   String? day;
   List<GoalTimeGeneratorRequest>? goalStatusList;

  GoalGeneratorRequest({
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
      'title': title,
      'description': description,
      'type': type,
      'day': day,
      'goalStatusList': goalStatusList?.map((goalTime) => goalTime.toJson()).toList(),
    };
  }
}

