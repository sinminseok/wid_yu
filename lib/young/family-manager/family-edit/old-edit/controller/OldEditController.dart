import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:wid_yu/old/frame/OldFrameView.dart';
import 'package:wid_yu/common/utils/Converter.dart';
import 'package:wid_yu/young/family-manager/dto/OldInformationResponseDto.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/api/OldEditApi.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/dto/OldEditProfileRequest.dart';
import 'package:wid_yu/young/frame/YoungFrameView.dart';

import '../dto/OldEditDiseaseRequest.dart';

class OldEditByYoungController extends GetxController {
  String? _name;

  List<int> _deleteId = [];
  List<OldEditDiseaseRequest> _addDisease = [];
  List<OldEditDiseaseRequest> _editDisease = [];

  List<OldEditDiseaseRequest> diseases = [];
  Rx<OldInformationResponseDto> _user = dubbyOld.obs;
  XFile? _changeProfile = null;

  // 사용자 정보 관련 컨트롤러
  late Rx<String> _addressController = "".obs;
  late TextEditingController _brithController;
  late TextEditingController _phoneNumberController;

  // 질병 관련 텍스트 컨트롤러
  List<TextEditingController> _drugNameControllers = [];
  List<TextEditingController> _diseaseControllers = [];
  List<TextEditingController> _explainControllers = [];

  RxBool _canSave = false.obs;

  OldEditByYoungController(OldInformationResponseDto user) {
    _user.value = user;
    _name = user.name!;
    initTextController(user);
    toEditDto(user);
    _phoneNumberController = TextEditingController(text: user.phoneNumber);
    _addressController.value = user.address!;
    _brithController = TextEditingController(text: user.birth);
  }

  void updatePhoneNumber(String number) {
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

  void toEditDto(OldInformationResponseDto user) {
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
  }

  void deleteDeisease(int index, OldEditDiseaseRequest disease) {
    diseases.remove(disease);
    _drugNameControllers.removeAt(index);
    _diseaseControllers.removeAt(index);
    _explainControllers.removeAt(index);

    if(disease.diseaseIdx != null){
      _deleteId.add(disease.diseaseIdx!);
    }
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

  void editFromYoung(BuildContext context) async {

    for (int i = 0; i < diseases.length; i++) {
      String updateDiseaseName = _diseaseControllers[i].text;
      String updateDrugName = _drugNameControllers[i].text;
      String updateExplain = _explainControllers[i].text;

      diseases[i].update(updateDiseaseName, updateDrugName, updateExplain);
    }

    for (int i = 0; i < diseases.length; i++) {
      if(diseases[i].diseaseIdx != null){
        _editDisease.add(diseases[i]);
      }else{
        _addDisease.add(diseases[i]);
      }
    }

    //질병 추가
    for (int i = 0; i < _addDisease.length; i++) {

      await OldEditApi().addDisease(_addDisease[i], _user.value.userIdx!);
    }

    // 질병 삭제
    for (int i = 0; i < _deleteId.length; i++) {

      await OldEditApi().deleteDisease(_deleteId[i], _user.value.userIdx!);
    }


    OldEditProfileRequest oldInformation = OldEditProfileRequest(name: _name, phoneNumber: _phoneNumberController.text, address: _addressController.value, birth: _brithController.text, diseases: _editDisease);

    String? url = _changeProfile == null ? null : _changeProfile?.path;

    // 프로필 사진 수정
    if(url != null){
      await OldEditApi().editProfileImageByYoung(url!, _user.value.userIdx!);
    }

    // 정보 수정 (+ 수정된 질병)
    await OldEditApi().editProfileByYoung(oldInformation, _user.value.userIdx!);


    Get.to(() => YoungFrameView(0));

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('동영상이 업로드 됐습니다.'),
    //   duration: Duration(seconds: 3),
    //   action: SnackBarAction(
    //     label: '확인',
    //     onPressed: () {},
    //   ),
    // ));

  }

  void editFromOld(BuildContext context) async {

    for (int i = 0; i < diseases.length; i++) {
      String updateDiseaseName = _diseaseControllers[i].text;
      String updateDrugName = _drugNameControllers[i].text;
      String updateExplain = _explainControllers[i].text;

      diseases[i].update(updateDiseaseName, updateDrugName, updateExplain);
    }

    for (int i = 0; i < diseases.length; i++) {
      if(diseases[i].diseaseIdx != null){
        _editDisease.add(diseases[i]);
      }else{
        _addDisease.add(diseases[i]);
      }
    }

    //질병 추가
    for (int i = 0; i < _addDisease.length; i++) {

      await OldEditApi().addDisease(_addDisease[i], _user.value.userIdx!);
    }

    // 질병 삭제
    for (int i = 0; i < _deleteId.length; i++) {

      await OldEditApi().deleteDisease(_deleteId[i], _user.value.userIdx!);
    }


    OldEditProfileRequest oldInformation = OldEditProfileRequest(name: _name, phoneNumber: _phoneNumberController.text, address: _addressController.value, birth: _brithController.text, diseases: _editDisease);

    String? url = _changeProfile == null ? null : _changeProfile?.path;

    // 프로필 사진 수정
    if(url != null){
      await OldEditApi().editProfileImageByOld(url!);
    }

    // 정보 수정 (+ 수정된 질병)
    await OldEditApi().editProfileByOld(oldInformation, );

    Get.to(() => OldFrameView(0));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('프로필 수정 완료.'),
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

  String get addressController => _addressController.value;

  List<TextEditingController> get drugNameControllers => _drugNameControllers;

  String? get name => _name; //OldEditProfileRequest? get user => _user;

  bool get canSave => _canSave.value;

  TextEditingController get brithController => _brithController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  List<TextEditingController> get diseaseControllers => _diseaseControllers;

  List<TextEditingController> get explainControllers => _explainControllers;

  OldInformationResponseDto get user => _user.value;

  XFile? get changeProfile => _changeProfile;
}
