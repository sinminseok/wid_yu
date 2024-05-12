
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalResponse.dart';
import 'package:wid_yu/final-dto/common-dto/response/goal/GoalTimeResponse.dart';
import 'package:wid_yu/goal-conduct/api/GoalConductApi.dart';

class DrugConductController extends GetxController{
  GoalConductApi api = GoalConductApi();

  GoalResponse _goal;

  DrugConductController(this._goal);

  Future<bool> uploadDrugImage(GoalTimeResponse goalTimeResponse,XFile image) async{
    print("fasff");
    print(goalTimeResponse.goalStatusIdx);
    var response = await api.uploadDrugImage(goalTimeResponse, image.path);

    if(response){
      return true;
    }
    return false;
  }

  Future<bool> successDrugGoal(GoalTimeResponse goalTimeResponse, XFile image)async{
    if(await uploadDrugImage(goalTimeResponse, image)){
      var response = await api.successGoal(goalTimeResponse);
      if(response){
        return response;
      }
    }
    return false;
  }

  GoalResponse get goal => _goal;
}