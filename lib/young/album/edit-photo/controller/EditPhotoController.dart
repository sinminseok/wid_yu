

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/album/edit-photo/dto/EditRewardRequest.dart';

import '../../../../final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import '../../popup/EditRewardPopup.dart';
import '../api/EditPhotoApi.dart';


class EditPhotoController extends GetxController{
  XFile? changeImage;
  late YoungRewardReadResponse _responseReward;
  late TextEditingController _textController;

  void updateImage(XFile changefile){
    changeImage = changefile;
  }

  void loadInit(YoungRewardReadResponse reward){
    _responseReward = reward;
    _textController = TextEditingController(text: reward.description);
  }

  void editReward(BuildContext context) async{
    String? updateURL = changeImage == null?null: changeImage?.path;
    EditRewardRequest editRewardRequest = EditRewardRequest(rewardIdx: _responseReward.rewardIdx!, description: _textController.text, type: _responseReward.type!);


    if(updateURL != null){
      bool response = await EditPhotoApi().editFile(_responseReward.rewardIdx!, updateURL);
    }

    bool response = await EditPhotoApi().editInformation(editRewardRequest);


    if(response){
      EditRewardPopup().showDialog(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('네트워크 오류.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: '확인',
          onPressed: () {},
        ),
      ));
    }

  }


  TextEditingController get textController => _textController;
}