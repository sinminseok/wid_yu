import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/utils/Color.dart';
import '../../../../../common/utils/FilePath.dart';

class YoungEditProfile extends StatefulWidget {
  const YoungEditProfile({Key? key}) : super(key: key);

  @override
  State<YoungEditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<YoungEditProfile> {
  XFile? image_picked; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

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
    return image_picked == null ?_buildNotSelectPhoto():_buildSelectPhoto();
  }

  Widget _buildSelectPhoto(){
    return Center(
        child: Container(
          width: 100.w,
          height: 100.w,
          margin: EdgeInsets.only(left: 0.w, top: 0.h),
          child: Stack(
            children: [
              Container(
                  width: 80.w,
                  height: 80.w,
                  margin: EdgeInsets.only(top: 10.h,left: 10.w),

                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.file(
                      File(image_picked!.path),
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Positioned(
                top: 59.h,
                left: 63.w,
                child: Stack(
                  children: [
                    Container(
                      width: 38.w,
                      height: 38.h,
                      decoration:
                      BoxDecoration(shape: BoxShape.circle, color: wWhiteColor),
                    ),
                    Positioned(
                      top: 9.h,
                      left: 9.w,
                      child: InkWell(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          width: 19.w,
                          height: 19.h,
                          child:
                          Image.asset(commonImagePath + "icon/camera_icon.png"),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildNotSelectPhoto(){
    return Center(
        child: Container(
          margin: EdgeInsets.only(left: 0.w, top: 0.h),
          child: Stack(
            children: [
              Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/images/user/blur-young.png",
                      width: 100.w, height: 100.h, fit: BoxFit.fitWidth)),

              Positioned(
                top: 59.h,
                left: 63.w,
                child: Stack(
                  children: [
                    Container(
                      width: 38.w,
                      height: 38.h,
                      decoration:
                      BoxDecoration(shape: BoxShape.circle, color: wWhiteColor),
                    ),
                    Positioned(
                      top: 9.h,
                      left: 9.w,
                      child: InkWell(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          width: 19.w,
                          height: 19.h,
                          child:
                          Image.asset(commonImagePath + "icon/camera_icon.png"),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
