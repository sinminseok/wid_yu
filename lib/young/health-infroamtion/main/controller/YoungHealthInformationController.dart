
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';

class YoungHealthInformationController extends GetxController{
  List<OldUser> users = [OldUser.empty(), OldUser.empty() ];

  Rx<OldUser?> currentUser = Rx<OldUser?>(null);

  void pickUser(int index){
    currentUser.value = users[index];
    update();
  }

  void initPickUser(){
    currentUser.value = users[0];
    update();
  }


  double? getUserO2(){
    return currentUser.value?.health?.spo2;
  }

  double? getUserTemperature(){
    return currentUser.value?.health?.temperature;
  }

  double? getUserHeartBit(){
    return currentUser.value?.health?.heartBit;
  }

}