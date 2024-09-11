

import 'package:get/get.dart';

import '../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import '../../api/GoalConductApi.dart';

class WalkConductController extends GetxController{
  GoalConductApi api = GoalConductApi();

  GoalTimeResponse? _todoTime;
  GoalResponse _goal;

  WalkConductController(this._goal);

  void selectTodoTime() {
    DateTime now = DateTime.now();
    GoalTimeResponse? closestTime;
    Duration? shortestDuration;

    for (var timeResponse in _goal.times!) {
      if (timeResponse.status == 0) {
        DateTime goalTime = DateTime.parse("${now.toLocal().toIso8601String().split('T').first} ${timeResponse.time}");
        Duration difference = goalTime.difference(now);

        if (difference.isNegative) {
          difference = -difference;
        }

        if (shortestDuration == null || difference < shortestDuration) {
          shortestDuration = difference;
          closestTime = timeResponse;
        }
      }
    }

    _todoTime = closestTime;

    if (_todoTime != null) {
      print(_todoTime!.time);
    }
    update(); // Notify listeners of state change
  }

  Future<bool> conductGoal() async {
    var response = await api.successGoal(_todoTime!);

    if (response) {
      return true;
    }
    return false;
  }

  GoalResponse get goal => _goal;

  GoalTimeResponse? get todoTime => _todoTime;
}