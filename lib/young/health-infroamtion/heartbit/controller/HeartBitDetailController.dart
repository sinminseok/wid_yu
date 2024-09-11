import 'package:get/get.dart';

import '../api/HeadtBitDetailApi.dart';
import '../dto/HealthResponse.dart';

class HeartBitDetailController extends GetxController {
  late HealthResponse healthResponse;

  Future<bool> loadInit(int userId) async {
    healthResponse = (await HeartBitDetailApi().loadHeartBitData(userId, "HEARTBIT"))!;
    return true;
  }
}
