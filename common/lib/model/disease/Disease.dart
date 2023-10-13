
import 'package:flutter/semantics.dart';

class Disease{
  final String diseaseName;
  final String? drug;
  final String? introduce;

  Disease(this.diseaseName, this.drug, this.introduce);

  String get getDiseaseName => diseaseName;
  String? get getDrug => drug;
  String? get getIntroduce => introduce;


}