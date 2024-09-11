
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../final-dto/common-dto/response/user/UserProfileResponse.dart';

class OldEditByOldController extends GetxController{
  Rx<UserProfileResponse> _user = UserProfileResponse("name", "url", "address", "br",).obs;

  late TextEditingController _addressController;
  late TextEditingController _brithController;

  RxBool _canSave = false.obs;


  OldEditByOldController() {
    _addressController = TextEditingController(text: _user.value.address);
    _brithController = TextEditingController(text: _user.value.brith);
  }



  void validateCanSave() {
    bool isNotEmpty = _addressController.text.isNotEmpty && _brithController.text.isNotEmpty;
    bool isAddressChanged = _addressController.text != _user.value.address;
    bool isBirthChanged = _brithController.text != _user.value.brith;
    _canSave.value =  isNotEmpty && (isAddressChanged || isBirthChanged);
  }

  void saveChanges() {

  }


  TextEditingController get addressController => _addressController;

  UserProfileResponse get user => _user.value;

  bool get canSave => _canSave.value;

  TextEditingController get brithController => _brithController;
}