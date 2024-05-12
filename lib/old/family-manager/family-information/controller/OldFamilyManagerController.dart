

import 'package:get/get.dart';
import 'package:wid_yu/common/dto/user/User.dart';

import '../../../../final-dto/common-dto/response/user/UserProfileResponse.dart';
import '../../../../young/family-manager/dto/OldInformationResponseDto.dart';
import '../../../../young/family-manager/dto/YoungInformationResponseDto.dart';
import '../../../../young/family-manager/family-information/api/FamilyManaerApi.dart';


class OldFamilyManagerController extends GetxController {
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