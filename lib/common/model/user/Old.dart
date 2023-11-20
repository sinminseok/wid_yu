

import '../disease/Disease.dart';

class Old{
  String name;
  int age;
  int phoneNumber;
  String address;
  bool hasDisease;
  List<Disease>? diseases;

  Old( this.name, this.age, this.phoneNumber,
      this.address, this.hasDisease);

  void addDiseases(List<Disease> disease){
    this.diseases?.addAll(disease);
  }

}