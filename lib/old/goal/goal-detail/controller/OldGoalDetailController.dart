
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../final-dto/common-dto/response/goal/GoalResponse.dart';
import '../../../../final-dto/common-dto/response/goal/PercentageOfDay.dart';
import '../../../../young/goal/goal-detail/api/YoungGoalApi.dart';

class OldGoalDetailController extends GetxController{
  List<GoalResponse> _goals = [];

  RxDouble _todayPercentage = 0.0.obs;
  RxDouble _todayPoint = 0.0.obs;

  List<PercentageOfDay> _monthPercentage = [];

  Future<bool> loadInit() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? uerIdx = await prefs.getInt("user_idx");
    //YoungGoalApi().loadPercentage(uerIdx!);
    _monthPercentage = await YoungGoalApi().loadMonthPercentage(uerIdx!);
    _todayPoint.value = await YoungGoalApi().loadTodayPoint();
    return true;
  }

  List<GoalResponse> toDrugGoals(){
    List<GoalResponse> filter = [];
    for(int i = 0; i < _goals.length; i++){
      if(_goals[i].type =="MEDICATION"){
        filter.add(_goals[i]);
      }
    }
    return filter;
  }

  List<GoalResponse> toWaolGoals(){
    List<GoalResponse> filter = [];
    for(int i = 0; i < _goals.length; i++){
      if(_goals[i].type =="WALKING"){
        filter.add(_goals[i]);
      }
    }
    return filter;
  }
  List<GoalResponse> toCommonGoals(){
    List<GoalResponse> filter = [];
    for(int i = 0; i < _goals.length; i++){
      if(_goals[i].type =="GENERAL"){
        filter.add(_goals[i]);
      }
    }
    return filter;
  }

  OldGoalDetailController(this._goals);

  List<GoalResponse> get goals => _goals;

  List<PercentageOfDay> get monthPercentage => _monthPercentage;

  RxDouble get todayPoint => _todayPoint;

  RxDouble get todayPercentage => _todayPercentage;
}