
import 'package:wid_yu/common/dto/goal/GoalTimeStatus.dart';

class GoalTime{
  String _time;
  GoalTimeStatus _status;
  int? _drugCount;
  List<String>? _images;

  GoalTime(this._time, this._status, this._drugCount, this._images);

  List<String>? get images => _images;

  int? get drugCount => _drugCount;

  GoalTimeStatus get status => _status;

  String get time => _time;
}