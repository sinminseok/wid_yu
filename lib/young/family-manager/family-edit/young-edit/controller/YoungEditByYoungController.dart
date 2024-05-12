import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';
import 'package:wid_yu/young/family-manager/dto/YoungInformationResponseDto.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/api/YoungEditApi.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/dto/YoundEditProfileRequest.dart';

import '../../../../../final-dto/common-dto/response/user/UserProfileResponse.dart';

class YoungEditByYoungController extends GetxController {
  Rx<YoungInformationResponseDto> _user = dubby.obs;

  late TextEditingController _addressController;
  late TextEditingController _brithController;
  XFile? _changeProfile = null;

  RxBool _canSave = false.obs;

  YoungEditByYoungController(YoungInformationResponseDto user) {

    _user.value = user;
    _addressController = TextEditingController(text: _user.value.address);
    _brithController = TextEditingController(text: _user.value.birth);

  }

  void updateInformation() {
    var youngEditProfileRequest = YoungEditProfileRequest(
        name: _user.value.name,
        profileImageUrl:
            _changeProfile == null ? _user.value.profileImageUrl : _changeProfile?.path,
        phoneNumber: _user.value.phoneNumber,
        address: _addressController.text,
        birth: _brithController.text);

    YoungEditApi().editYoungProfile(youngEditProfileRequest);
  }

  void updateProfileUrl(XFile xFile) {
    _changeProfile = xFile;
  }

  void validateCanSave() {
    bool isNotEmpty =
        _addressController.text.isNotEmpty && _brithController.text.isNotEmpty;
    bool isAddressChanged = _addressController.text != _user.value.address;
    bool isBirthChanged = _brithController.text != _user.value.birth;
    _canSave.value = isNotEmpty && (isAddressChanged || isBirthChanged);
  }

  void updateProfile() {
    YoungEditProfileRequest(
        name: '',
        profileImageUrl: '',
        phoneNumber: '',
        address: _addressController.text,
        birth: _brithController.text);
  }

  TextEditingController get addressController => _addressController;

  YoungInformationResponseDto get user => _user.value;

  bool get canSave => _canSave.value;

  TextEditingController get brithController => _brithController;
}
