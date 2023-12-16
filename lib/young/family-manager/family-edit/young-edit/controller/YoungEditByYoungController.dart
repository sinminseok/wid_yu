import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/model/user/User.dart';

class YoungEditByYoungController extends GetxController {
  Rx<User> _user = User("사용자", "010 1234 1234", "오목로11길 5", "2000.10.31").obs;

  late TextEditingController _addressController;
  late TextEditingController _brithController;

  RxBool _canSave = false.obs;


  YoungEditByYoungController() {
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


  TextEditingController get addressController => _addressController;

  User get user => _user.value;

  bool get canSave => _canSave.value;

  TextEditingController get brithController => _brithController;
}