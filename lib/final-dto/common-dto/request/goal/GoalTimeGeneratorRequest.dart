
class GoalTimeGeneratorRequest{
  final String time;
  int? pullNum;

  GoalTimeGeneratorRequest(this.time, this.pullNum);

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'pillNum': pullNum,
    };
  }
}