
import 'dart:core';

import 'MissionType.dart';


class Mission{
  String _title;
  String _subtitle;
  MissionType _type;
  // List<MissionTime> _times;

  Mission(this._title, this._subtitle, this._type);

 // List<MissionTime> get times => _times;

  String get subtitle => _subtitle;

  MissionType get missionType => _type;

  String get title => _title;
}