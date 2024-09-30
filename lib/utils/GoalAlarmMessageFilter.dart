
import '../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../sql-lite/Meaasge.dart';

class GoalAlarmMessageFilter{

  GoalResponse? filterTodoGoal(MessageFcm messageFcm, List<GoalResponse> totalGoals){
    // MessageFcm의 title에서 "{미션이름}" 부분 추출을 위한 정규식
    RegExp regExp = RegExp(r"^(.*)을 수행할 시간이에요\.$");
    Match? match = regExp.firstMatch(messageFcm.title);

    // 매칭되는 부분이 있다면 미션 이름 추출
    if (match != null) {
      String missionTitle = match.group(1)!.trim(); // 첫 번째 그룹이 미션 이름

      // _totalGoals 리스트에서 title과 일치하는 GoalResponse 찾기
      for (GoalResponse goal in totalGoals) {
        if (goal.title != null && goal.title!.contains(missionTitle)) {
          return goal;
        }
      }
    }
    return null;
  }

  GoalResponse? filterSuccessGoal(MessageFcm messageFcm, List<GoalResponse> totalGoals){
    // MessageFcm의 title에서 "{미션이름}" 부분 추출을 위한 정규식
    RegExp regExp = RegExp(r"^(.*)를 수행하셨어요\.$");
    Match? match = regExp.firstMatch(messageFcm.title);

    // 매칭되는 부분이 있다면 미션 이름 추출
    if (match != null) {
      String missionTitle = match.group(1)!.trim(); // 첫 번째 그룹이 미션 이름

      // _totalGoals 리스트에서 title과 일치하는 GoalResponse 찾기
      for (GoalResponse goal in totalGoals) {
        print("---" + goal.title!);
        if (goal.title != null && goal.title!.contains(missionTitle)) {
          return goal;
        }
      }
    }
    return null;
  }

  GoalResponse? filterFailedGoal(MessageFcm messageFcm, List<GoalResponse> totalGoals){
    // MessageFcm의 title에서 "{미션이름}" 부분 추출을 위한 정규식
    RegExp regExp = RegExp(r"^(.*)을 하지 않았어요\.$");
    Match? match = regExp.firstMatch(messageFcm.title);

    // 매칭되는 부분이 있다면 미션 이름 추출
    if (match != null) {
      String missionTitle = match.group(1)!.trim(); // 첫 번째 그룹이 미션 이름

      // _totalGoals 리스트에서 title과 일치하는 GoalResponse 찾기
      for (GoalResponse goal in totalGoals) {
        print("---" + goal.title!);
        if (goal.title != null && goal.title!.contains(missionTitle)) {
          return goal;
        }
      }
    }
    return null;
  }


}