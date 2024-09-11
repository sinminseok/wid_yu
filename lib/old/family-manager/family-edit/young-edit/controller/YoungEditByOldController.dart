
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../young/family-manager/dto/YoungInformationResponseDto.dart';

class YoungEditByOldController extends GetxController {

  late YoungInformationResponseDto _user;



  YoungEditByOldController(YoungInformationResponseDto _young) {
    _user = _young;
  }



  void saveChanges() {
  }

  YoungInformationResponseDto get user => _user;
}