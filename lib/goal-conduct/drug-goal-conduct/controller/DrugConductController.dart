import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import 'package:wid_yu/goal-conduct/api/GoalConductApi.dart';

class DrugConductController extends GetxController {
  GoalConductApi api = GoalConductApi();

  GoalTimeResponse? _todoTime;
  GoalResponse _goal;

  DrugConductController(this._goal);

  GoalTimeResponse? get todoTime => _todoTime;

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

    update(); // Notify listeners of state change
  }

  Future<bool> uploadDrugImage(GoalTimeResponse goalTimeResponse, XFile image) async {
    var response = await api.uploadDrugImage(goalTimeResponse, image.path);
    await api.successGoal(goalTimeResponse);

    if (response) {
      return true;
    }
    return false;
  }

  Future<bool> successDrugGoal(GoalTimeResponse goalTimeResponse, XFile image) async {
    bool response = await uploadDrugImage(goalTimeResponse, image);
    return response;
  }

  GoalResponse get goal => _goal;
}