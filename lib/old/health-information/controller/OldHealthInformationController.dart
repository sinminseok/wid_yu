
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/health/Health.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserResponse.dart';

import '../../../common/dto/user/OldUser.dart';
import '../../../final-dto/common-dto/response/user/UserType.dart';

class OldHealthInformationController extends GetxController {

  Rx<UserResponse> user = UserResponse("name", "url", 12, UserType.SENIOR, []).obs;

  double? getUserO2(){
    return 1;
  }

  double? getUserTemperature(){
    return 2;
  }

  double? getUserHeartBit(){
    return 3;
  }
}