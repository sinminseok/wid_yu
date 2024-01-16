
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/health/Health.dart';
import 'package:wid_yu/common/dto/user/User.dart';
import 'package:wid_yu/common/dto/user/UserType.dart';

import '../../../common/dto/user/OldUser.dart';

class OldHealthInformationController extends GetxController {

  Rx<OldUser> user = OldUser("김옥례", "010 1234 1234", "20001031","오목로",UserType.OLD,[],"1234",true,100,Health(50,60,70), true).obs;

  double? getUserO2(){
    return user.value.health?.spo2;
  }

  double? getUserTemperature(){
    return user.value.health?.temperature;
  }

  double? getUserHeartBit(){
    return user.value.health?.heartBit;
  }
}