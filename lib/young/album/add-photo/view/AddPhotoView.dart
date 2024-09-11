import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wid_yu/common/common-widget/button/OrangeButton.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/PopUp.dart';
import 'package:wid_yu/final-dto/young-dto/request/reward/YoungRewardGeneratorRequest.dart';
import 'package:wid_yu/young/album/add-photo/api/AddPhotoApi.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/common-widget/button/PurpleButton.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';
import '../../popup/SaveRewardPopup.dart';

class AddPhotoView extends StatefulWidget {
  const AddPhotoView({Key? key}) : super(key: key);

  @override
  _AddPhotoViewState createState() => _AddPhotoViewState();
}


class _AddPhotoViewState extends State<AddPhotoView> {
  XFile? image_picked; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화
  TextEditingController _textController = TextEditingController();

  //이미지를 가져오는 함수
  Future getImage() async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image_picked = pickedFile;
      });
    }
  }

  Future<bool> createReward() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    var userIdx = await prefs.getInt("user_idx");
    var youngRewardGeneratorRequest = YoungRewardGeneratorRequest(userIdx: userIdx, url: image_picked?.path, description: _textController.text);
    return await AddPhotoApi().createPhotoReward(youngRewardGeneratorRequest, "IMAGE");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '사진 올리기',
        color: wPurpleBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            _buildPhotoInformation(),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoInformation() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50.h,left: 12.w, right: 12.w),
        width: 351.w,
        decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image_picked == null
                ? _buildNotYetSelectPhoto()
                : _buildDoneSelectPhoto(),
            Stack(
              children: [
                Container(
                  width: 210.w,
                  height: 80,
                  margin: EdgeInsets.only(top: 0.h, left: 20.w, right: 20.w,bottom: 30.h),
                  child: TextFormField(
                    controller: _textController,
                    style: TextStyle(color: Colors.black, height: 1.7.h),
                    textAlign: TextAlign.left,
                    cursorColor: kTextBlackColor,
                    keyboardType: TextInputType.multiline, // 여러 줄 입력을 가능하게 함
                    maxLines: null, // 또는 maxLines를 null로 설정
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "메모 입력",
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                      hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                      border: InputBorder.none,
                    ),
                    maxLength: 45,
                    textInputAction: TextInputAction.done, // 완료 버튼 활성화

                  ),
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 43.h,left: 20.w),
                      width: 210.w,
                      height: 1.h,
                      color: wGrey300Color,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 28.h, left: 20.w),
                      width: 210.w,
                      height: 1.h,
                      color: wGrey300Color,
                    ),
                  ],
                )
              ],
            )


          ],
        ),
      ),
    );
  }

  Widget _buildNotYetSelectPhoto() {
    return InkWell(
      onTap: () {
        getImage();
      },
      child: Container(
        margin: EdgeInsets.only(top: 40.h,left: 13.w, right: 13.w),
        width: 324.w,
        height: 210.w,
        decoration: BoxDecoration(
            color: wGrey300Color,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                child: Image.asset("assets/images/icon/gallery-icon.png")
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Helper2Text(
                  "사진 선택",
                    wGrey600Color
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoneSelectPhoto() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 40.h,left: 13.w, right: 13.w),
          width: 310.w,
          height: 210.w,
          decoration: BoxDecoration(
              color: wGrey300Color,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Image.file(
            File(image_picked!.path),
            fit: BoxFit.fitWidth,
          )),
    );
  }

  Widget _buildSaveButton(){
    return Container(
        margin: EdgeInsets.only(top: 150.h,right: 20.w,left: 20.w),
        child: InkWell(
            onTap: ()async{
              if(image_picked == null || _textController.text == ""){
                ToastMessage().showtoast("정보를 모두 입력해주세요.");
              }else{
                var bool = await createReward();
                if(bool){
                  SaveRewardPopup().showDialog(context);
                }

              }

            },
            child: PurpleButton("저장하기")));
  }
}
