
enum GoalType{
  MEDICATION,
  WALKING,
  GENERAL

}

String parseGoalTypeToString(GoalType goalType) {
  return goalType.toString().split('.').last;
}
