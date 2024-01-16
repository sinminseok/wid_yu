
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/dto/disease/Disease.dart';


class OldDiseaseEditByOldController extends GetxController{
  RxList<Disease> _disease = [Disease("감기1", "타이레놀1", "복용방법버버버ㅓㅂ1"),
    // Disease("감기2", "타이레놀2", "복용방2법버1버버ㅓㅂ1"),
    // Disease("감기3", "타이레놀3", "복용방법버3버버ㅓㅂ1"),
  ].obs;

  late List<TextEditingController> _diseaseNameControllers;
  late List<TextEditingController> _drugNameControllers;
  late List<TextEditingController> _informationNameControllers;

  OldDiseaseEditByOldController(){
    _diseaseNameControllers = List.generate(
        _disease.length, (index) => TextEditingController());
    _drugNameControllers = List.generate(
        _disease.length, (index) => TextEditingController());
    _informationNameControllers = List.generate(
        _disease.length, (index) => TextEditingController());

    for (int i = 0; i < _disease.length; i++) {
      _diseaseNameControllers[i].text = _disease[i].name;
      _drugNameControllers[i].text = _disease[i].medicline!;
      _informationNameControllers[i].text = _disease[i].description!;
    }
  }

  void addDisease(String name, String drug, String information){
    var disease = Disease(name, drug, information);
    _disease.add(disease);
  }

  void deleteDisease(Disease disease){
    _disease.remove(disease);
  }


  List<TextEditingController> get diseaseNameControllers =>
      _diseaseNameControllers;

  List<Disease> get disease => _disease.value;

  List<TextEditingController> get drugNameControllers => _drugNameControllers;

  List<TextEditingController> get informationNameControllers =>
      _informationNameControllers;
}