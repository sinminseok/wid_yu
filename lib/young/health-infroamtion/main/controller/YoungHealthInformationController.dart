
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/disease/Disease.dart';
import 'package:wid_yu/common/dto/health/Health.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserType.dart';

import '../../../../final-dto/common-dto/response/user/UserResponse.dart';

class YoungHealthInformationController extends GetxController{
  List<UserResponse> users = [UserResponse("name", "das", 11, UserType.SENIOR, []) ];

  Rx<UserResponse?> currentUser = Rx<UserResponse?>(null);

  void pickUser(int index){
    currentUser.value = users[index];
    update();
  }

  void initPickUser(){
    currentUser.value = users[0];
    update();
  }


  double? getUserO2(){
    return 1;
  }

  double? getUserTemperature(){
    return 1;
  }

  double? getUserHeartBit(){
    return 1;
  }

}