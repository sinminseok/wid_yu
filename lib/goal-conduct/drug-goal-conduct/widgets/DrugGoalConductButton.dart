
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../FinishConductView.dart';
import '../controller/DrugConductController.dart';
import '../view/DrugTakePhotoView.dart';

class DrugGoalConductButton extends StatefulWidget {

  DrugConductController controller;


  DrugGoalConductButton(this.controller);

  @override
  State<DrugGoalConductButton> createState() => _DrugGoalConductButtonState();
}

class _DrugGoalConductButtonState extends State<DrugGoalConductButton> {
  XFile? image_picked; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화
  TextEditingController _textController = TextEditingController();

  //이미지를 가져오는 함수
  Future<bool> getImage() async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image_picked = pickedFile;
      });

      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.h),
            height: 24.h,
            child: ButtonText("다시 알림", wPurpleColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 335.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 108.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: wGrey300Color),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: wGrey200Color
                  ),
                  child: Center(
                    child: ButtonText("끄기", wGrey600Color),
                  ),
                ),
                InkWell(
                  onTap: (){
                    getImage();
                    //Get.to(() => DrugTakePhoto());
                  },
                  child: Container(
                    width: 221.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: wOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: wOrange200Color)
                    ),
                    child: InkWell(
                      onTap: ()async{
                        var response = await getImage();
                        if(response){
                          Get.to(() => DrugTakePhoto(image_picked!,widget.controller.goal.times[0], widget.controller));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('약 사진을 찍어주세요.'),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: '확인',
                              onPressed: () {},
                            ),
                          ));

                        }

                      },
                      child: Center(
                        child: ButtonText("복용 사진 찍어서 완료하기", wWhiteColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
