import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/common-widget/button/PurpleButton.dart';
import '../../../../common/utils/Color.dart';
import '../../../../final-dto/young-dto/response/reward/YoungRewardReadResponse.dart';
import '../controller/EditPhotoController.dart';

class EditPhotoView extends StatefulWidget {
  YoungRewardReadResponse reward;


  EditPhotoView(this.reward);

  @override
  _EditPhotoViewState createState() => _EditPhotoViewState();
}

class _EditPhotoViewState extends State<EditPhotoView> {
  XFile? image_picked; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  EditPhotoController _controller = EditPhotoController();


  //이미지를 가져오는 함수
  Future getImage() async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image_picked = pickedFile;
        _controller.updateImage(image_picked!);
      });
    }
  }


  @override
  void initState() {
    _controller.loadInit(widget.reward);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: wPurpleBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '사진 수정하기',
        color: wPurpleBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPhotoInformation(_controller.textController),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoInformation(TextEditingController _textController) {
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
                  margin: EdgeInsets.only(top: 6.h, left: 20.w, right: 20.w,bottom: 30.h),
                  child: TextFormField(
                    controller: _textController,
                    style: TextStyle(color: Colors.black, height: 1.5.h),
                    textAlign: TextAlign.left,
                    cursorColor: kTextBlackColor,
                    keyboardType: TextInputType.multiline, // 여러 줄 입력을 가능하게 함
                    maxLines: null, // 또는 maxLines를 null로 설정
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "메모 입력",

                      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                      hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp, fontFamily: "hint"),
                      border: InputBorder.none,
                    ),
                    maxLength: 45,
                    textInputAction: TextInputAction.done, // 완료 버튼 활성화

                  ),
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 47.h,left: 20.w),
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
        child:  Container(
            child: Image.network(widget.reward.url!, fit: BoxFit.fitWidth,)
        ),
      ),
    );
  }

  Widget _buildDoneSelectPhoto() {
    return Container(

      child: Container(
          margin: EdgeInsets.only(top: 40.h,left: 13.w, right: 13.w),
          width: 324.w,
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
        margin: EdgeInsets.only(top: 100.h,right: 20.w,left: 20.w),
        child: InkWell(
            onTap: (){
              _controller.editReward(context);
              //EditRewardPopup().showDialog(context);
            },
            child: PurpleButton("수정 완료하기")));
  }
}