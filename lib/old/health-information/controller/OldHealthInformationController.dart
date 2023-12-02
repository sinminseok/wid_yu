
import 'package:get/get.dart';
import 'package:wid_yu/common/model/user/TestHealth.dart';
import 'package:wid_yu/common/model/user/TestUser.dart';

class OldHealthInformationController extends GetxController {

  Rx<TestUser> user = TestUser("김옥순", TestHealth(90,80,40), true).obs;

  double? getUserO2(){
    return user.value?.testHealth.o2;
  }

  double? getUserTemperature(){
    return user.value?.testHealth.temperature;
  }

  double? getUserHeartBit(){
    return user.value?.testHealth.healthBit;
  }
}