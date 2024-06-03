
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/dto/user/User.dart';
import '../../../../../final-dto/common-dto/response/user/UserProfileResponse.dart';
import '../../../../../young/family-manager/dto/YoungInformationResponseDto.dart';

class YoungEditByOldController extends GetxController {
  //Rx<UserProfileResponse> _user = UserProfileResponse("사용자", "010 1234 1234", "오목로11길 5", "2000.10.31").obs;

  late YoungInformationResponseDto _user;
  late String _addressController;
  late String _brithController;

  RxBool _canSave = false.obs;


  YoungEditByOldController(YoungInformationResponseDto _young) {
    _user = _young;
    //_addressController = TextEditingController(text: _user.value.address);
    //_brithController = TextEditingController(text: _user.value.brith);
  }



  void saveChanges() {

    // // Add logic to save changes here
    // // For example, update the user object with the new values
    // _user.update((user) {
    //     _addressController.text;
    //     _brithController.text;
    //   // Update other properties as needed
    // });
    //
    // // Reset the canSave flag after saving changes
    // _canSave.value = false;
  }

  YoungInformationResponseDto get user => _user;
}