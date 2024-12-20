

import 'package:get/get.dart';

import '../../../../young/family-manager/dto/OldInformationResponseDto.dart';
import '../../../../young/family-manager/dto/YoungInformationResponseDto.dart';
import '../api/OldFamilyManagerApi.dart';


class OldFamilyManagerController extends GetxController {
  List<YoungInformationResponseDto> _myUser = [];
  List<OldInformationResponseDto> _olds = [];


  Future<bool> loadInit()async{
    _myUser = await OldFamilyManagerApi().searchYoungs();

    _olds = await OldFamilyManagerApi().searchOlds();

    return true;
  }
  List<OldInformationResponseDto> get olds => _olds;

  List<YoungInformationResponseDto> get myUser => _myUser;
}