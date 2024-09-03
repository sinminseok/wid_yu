
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/young/goal/goal-detail/api/YoungGoalApi.dart';

import '../../../../final-dto/common-dto/response/goal/PercentageOfDay.dart';

class YoungGoalDetailController extends GetxController{
  List<GoalResponse> _goals = [];

  RxDouble _todayPercentage = 10.0.obs;
  List<PercentageOfDay> _monthPercentage = [];

  Future<bool> loadInit() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? uerIdx = await prefs.getInt("user_idx");
    _todayPercentage.value = await YoungGoalApi().loadPercentage(uerIdx!);
    _monthPercentage = await YoungGoalApi().loadMonthPercentage(uerIdx!);

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


  YoungGoalDetailController(this._goals);

  List<PercentageOfDay> get monthPercentage => _monthPercentage;

  RxDouble get todayPercentage => _todayPercentage;
}