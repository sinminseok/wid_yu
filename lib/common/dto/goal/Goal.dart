
import 'package:wid_yu/common/dto/goal/Day.dart';
import 'package:wid_yu/common/dto/goal/GoalTime.dart';
import 'package:wid_yu/common/dto/goal/GoalType.dart';

class Goal{
  String _title;
  String _description;
  GoalType _goalType;
  List<GoalTime> _times;
  List<int> _day;

  Goal(this._title, this._description, this._goalType, this._times, this._day);

  List<int> get day => _day;

  List<GoalTime> get times => _times;

  GoalType get goalType => _goalType;

  String get description => _description;

  String get title => _title;
}