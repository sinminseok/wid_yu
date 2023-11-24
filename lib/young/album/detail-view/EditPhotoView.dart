import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wid_yu/young/album/popup/EditRewardPopup.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/common-widget/PurpleButton.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../popup/SaveRewardPopup.dart';

class EditPhotoView extends StatefulWidget {
  const EditPhotoView({Key? key}) : super(key: key);

  @override
  _EditPhotoViewState createState() => _EditPhotoViewState();
}

class _EditPhotoViewState extends State<EditPhotoView> {
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
            _buildPhotoInformation(),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoInformation() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Center(
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
            children: [
              Center(
                child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: Image.asset(
                      commonImagePath + "album/photo_dot.png",
                    )),
              ),
              image_picked == null
                  ? _buildNotYetSelectPhoto()
                  : _buildDoneSelectPhoto(),
              Container(
                margin: EdgeInsets.only(top: 14.h, left: 20.w, right: 20.w,bottom: 30.h),
                child: TextFormField(
                  controller: _textController,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.left,
                  cursorColor: kTextBlackColor,
                  keyboardType: TextInputType.multiline, // 여러 줄 입력을 가능하게 함
                  maxLines: null, // 또는 maxLines를 null로 설정
                  decoration: InputDecoration(
                    hintText: "메모 입력",
                    hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.done, // 완료 버튼 활성화

                ),
              ),


            ],
          ),
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
        width: 310.w,
        height: 210.w,

        decoration: BoxDecoration(
            color: wGrey300Color,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                child: Icon(
                  Icons.photo_camera_back,
                  color: wGrey600Color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  "사진 선택",
                  style: TextStyle(color: wGrey600Color, fontSize: 16.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoneSelectPhoto() {
    return Container(
        width: 310.w,
        height: 210.w,
        decoration: BoxDecoration(
            color: wGrey300Color,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Image.file(
          File(image_picked!.path),
          fit: BoxFit.fitWidth,
        ));
  }

  Widget _buildSaveButton(){
    return Container(
        margin: EdgeInsets.only(top: 100.h),
        child: InkWell(
            onTap: (){
              EditRewardPopup().showDialog(context);
            },
            child: PurpleButton("수정 완료하기")));
  }
}