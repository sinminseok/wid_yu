
class PercentageOfDay {
  int day;
  double? percentage;

  PercentageOfDay(this.day, this.percentage);

  // fromJson factory constructor
  factory PercentageOfDay.fromJson(Map<String, dynamic> json) {
    return PercentageOfDay(
      json['day'] as int,
      json['daily_achievement_rate'] as double
    );
  }
}