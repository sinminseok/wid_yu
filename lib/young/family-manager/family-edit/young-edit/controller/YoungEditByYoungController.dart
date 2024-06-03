import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:wid_yu/common/dto/user/YoungUser.dart';
import 'package:wid_yu/young/family-manager/dto/YoungInformationResponseDto.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/api/YoungEditApi.dart';
import 'package:wid_yu/young/family-manager/family-edit/young-edit/dto/YoundEditProfileRequest.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';

import '../../../../../final-dto/common-dto/response/user/UserProfileResponse.dart';

class YoungEditByYoungController extends GetxController {
  Rx<YoungInformationResponseDto> _user = dubby.obs;

  Rx<String> _addressController = "".obs;
  late TextEditingController _brithController;
  XFile? _changeProfile = null;

  RxBool _canSave = false.obs;

  YoungEditByYoungController(YoungInformationResponseDto user) {

    _user.value = user;
    _addressController.value = _user.value.address!;
    _brithController = TextEditingController(text: _user.value.birth);

  }

  void updateInformation(BuildContext context) async {
    var youngEditProfileRequest = YoungEditProfileRequest(
        name: _user.value.name,

        phoneNumber: _user.value.phoneNumber,
        address: _addressController.value,
        birth: _brithController.text);

    String? url = _changeProfile == null ? null : _changeProfile?.path;

     await YoungEditApi().editYoungProfile(youngEditProfileRequest);
     if(url != null){
       await YoungEditApi().editProfileUrl(url!);
     }

     Get.to(() => YoungFrameView(0));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('프로필이 수정되었습니다.'),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: '확인',
        onPressed: () {},
      ),
    ));
  }

  void updateProfileUrl(XFile xFile) {
    _changeProfile = xFile;
  }

  void validateCanSave() {
    bool isNotEmpty =
         _brithController.text.isNotEmpty;
    //bool isAddressChanged = _addressController.text != _user.value.address;
    bool isBirthChanged = _brithController.text != _user.value.birth;
    _canSave.value = isNotEmpty && (isBirthChanged);
  }

  void addressAPI(BuildContext context) async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );

    String address =

        "${model.zonecode!} ${model.address!} ${model.buildingName!}";
    _addressController.value = address;
  }


  String get addressController => _addressController.value;

  YoungInformationResponseDto get user => _user.value;

  bool get canSave => _canSave.value;

  TextEditingController get brithController => _brithController;
}
