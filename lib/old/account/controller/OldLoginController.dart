

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OldLoginController extends GetxController{
  final TextEditingController _codeController = TextEditingController();

  TextEditingController get codeController => _codeController;
  RxInt _canNextStep = 0.obs;

  void validateNextStep(){
    _canNextStep.value = -1;
  }

  int get canNextStep => _canNextStep.value;
}