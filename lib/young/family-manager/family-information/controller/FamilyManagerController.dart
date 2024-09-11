

import 'package:get/get.dart';
import 'package:wid_yu/young/family-manager/dto/OldInformationResponseDto.dart';
import 'package:wid_yu/young/family-manager/family-information/api/FamilyManaerApi.dart';

import '../../dto/YoungInformationResponseDto.dart';

class FamilyManagerByYoungController extends GetxController {
  List<YoungInformationResponseDto> _myUser = [];
  List<OldInformationResponseDto> _olds = [];


  Future<bool> loadInit()async{
    _myUser = await FamilyManagerApi().searchYoungs();
    _olds = await FamilyManagerApi().searchOlds();


    return true;
  }

  List<OldInformationResponseDto> get olds => _olds;

  List<YoungInformationResponseDto> get myUser => _myUser;
}