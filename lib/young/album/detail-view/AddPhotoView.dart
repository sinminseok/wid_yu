import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/FilePath.dart';
import '../widgets/PointWidget.dart';
import '../widgets/SecretPhotoWidget.dart';

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
        reverse: true,
        child: Column(
          children: [
            _buildPhotoInformation(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: wGrey600Color
                ),
                child: TextFormField(

                  controller: _textController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),

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
          margin: EdgeInsets.only(top: 50.h),
          width: 351.w,
          height: 367.h,
          decoration: BoxDecoration(
            color: kTextWhiteColor,
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
              // Container(
              //   padding: EdgeInsets.only(bottom: 8.0), // Adjust bottom padding
              //   child: TextField(
              //
              //     controller: _textController,
              //
              //     maxLines: 2,
              //     decoration: InputDecoration(
              //       border: UnderlineInputBorder(),
              //     ),
              //     style: TextStyle(fontSize: 18.0),
              //   ),
              // ),


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
        width: 324.w,
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
        width: 324.w,
        height: 210.w,
        decoration: BoxDecoration(
            color: wGrey300Color,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Image.file(
          File(image_picked!.path),
          fit: BoxFit.fitWidth,
        ));
  }
}
