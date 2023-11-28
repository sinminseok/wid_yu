
import 'package:get/get.dart';
import 'package:wid_yu/common/model/user/TestHealth.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';

class YoungHealthInformationController extends GetxController{
  List<TestUser> users = [TestUser("부모님1", TestHealth(50, 60, 70)),TestUser("부모님2", TestHealth(10, 20, 100)),];

  Rx<TestUser?> currentUser = Rx<TestUser?>(null);

  void pickUser(int index){
    currentUser.value = users[index];
    update();
  }

  void initPickUser(){
    currentUser.value = users[0];
    update();
  }

  double? getUserO2(){
    return currentUser.value?.testHealth.o2;
  }

  double? getUserTemperature(){
    return currentUser.value?.testHealth.temperature;
  }

  double? getUserHeartBit(){
    return currentUser.value?.testHealth.healthBit;
  }
}