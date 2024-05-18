import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/OldUser.dart';
import 'package:wid_yu/dto/old-dto/request/OldGeneratorRequest.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserProfileResponse.dart';
import 'package:wid_yu/final-dto/common-dto/response/user/UserResponse.dart';
import 'package:wid_yu/utils/Converter.dart';
import 'package:wid_yu/young/family-manager/dto/OldInformationResponseDto.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/dto/OldEditProfileRequest.dart';

import '../../../../../common/dto/health/Health.dart';
import '../dto/OldEditDiseaseRequest.dart';

class OldEditByYoungController extends GetxController {
  //OldEditProfileRequest? _user;
  List<OldEditDiseaseRequest> diseases = [];

  // 사용자 정보 관련 컨트롤러
  late TextEditingController _addressController;
  late TextEditingController _brithController;
  late TextEditingController _phoneNumberController;

  // 질병 관련 텍스트 컨트롤러
  List<TextEditingController> _drugNameControllers = [];
  List<TextEditingController> _diseaseControllers = [];
  List<TextEditingController> _explainControllers = [];

  RxBool _canSave = false.obs;

  OldEditByYoungController(OldInformationResponseDto user) {
    initTextController(user);
    toEditDto(user);
    _phoneNumberController = TextEditingController(text: user.phoneNumber);
    _addressController = TextEditingController(text: user.address);
    _brithController = TextEditingController(text: user.birth);
  }

  void updateProfileImage(String imagePath){

  }

  void updatePhoneNumber(String number){
    _phoneNumberController.text = ConverterCutom.toServerPhoneNumber(number);
  }

  void initTextController(OldInformationResponseDto user) {
    _drugNameControllers =
        List.generate(user.diseases!.length, (_) => TextEditingController());
    _diseaseControllers =
        List.generate(user.diseases!.length, (_) => TextEditingController());
    _explainControllers =
        List.generate(user.diseases!.length, (_) => TextEditingController());
  }

  OldEditProfileRequest toEditDto(OldInformationResponseDto user) {
    diseases = [];
    for (int i = 0; i < user.diseases!.length; i++) {
      diseases.add(OldEditDiseaseRequest(
          diseaseIdx: user.diseases![i].diseaseIdx,
          name: user.diseases![i].diseaseName,
          drugName: user.diseases![i].drugName,
          explanation: user.diseases![i].explanation));
      _drugNameControllers[i] =
          TextEditingController(text: user.diseases![i].drugName);
      _diseaseControllers[i] =
          TextEditingController(text: user.diseases![i].diseaseName);
      _explainControllers[i] =
          TextEditingController(text: user.diseases![i].explanation);
    }

    return OldEditProfileRequest(
        name: '',
        profileImageUrl: '',
        phoneNumber: '',
        address: '',
        birth: '',
        diseases: diseases);
  }

  void deleteDeisease(int index, OldEditDiseaseRequest disease) {
    diseases.remove(disease);
    _drugNameControllers.removeAt(index);
    _diseaseControllers.removeAt(index);
    _explainControllers.removeAt(index);
  }

  void editInformation() {
    print(diseases.length);

    for (int i = 0; i < diseases.length; i++) {
      String updateDiseaseName = _diseaseControllers[i].text;
      String updateDrugName = _drugNameControllers[i].text;
      String updateExplain = _explainControllers[i].text;

      diseases[i].update(updateDiseaseName, updateDrugName, updateExplain);
    }

    for (int i = 0; i < diseases.length; i++) {
      print(diseases[i].drugName);
      print(diseases[i].diseaseIdx);
      print(diseases[i].name);
      print(diseases[i].explanation);
      print("--------");
    }

  }

  void addDisease() {
    TextEditingController _addDrugNameController = TextEditingController();
    TextEditingController _addDiseaseNameController = TextEditingController();
    TextEditingController _addExplainController = TextEditingController();
    _drugNameControllers.add(_addDrugNameController);
    _diseaseControllers.add(_addDiseaseNameController);
    _explainControllers.add(_addExplainController);

    var oldEditDiseaseRequest = OldEditDiseaseRequest(
        diseaseIdx: null,
        name: _addDiseaseNameController.text,
        drugName: _addDrugNameController.text,
        explanation: _addExplainController.text);
    diseases.add(oldEditDiseaseRequest);
  }



  TextEditingController get addressController => _addressController;

  List<TextEditingController> get drugNameControllers => _drugNameControllers;

  //OldEditProfileRequest? get user => _user;

  bool get canSave => _canSave.value;

  TextEditingController get brithController => _brithController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  List<TextEditingController> get diseaseControllers => _diseaseControllers;

  List<TextEditingController> get explainControllers => _explainControllers;
}
