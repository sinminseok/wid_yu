
import 'package:flutter/cupertino.dart';

import '../../model/disease/Disease.dart';
import '../../model/user/Old.dart';

class SeniorViewModel extends ChangeNotifier{


  void addOld(String name, int age, int phoneNumber, String address, bool hasDisease){
    Old(name, age, phoneNumber, address, hasDisease);
  }

  void addDisease(Old old, List<Disease> diseases){
    old.addDiseases(diseases);
  }

}