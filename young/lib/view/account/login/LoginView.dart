import 'package:common/model/account/AwsServices.dart';
import 'package:common/modelView/login/KakaoLogin.dart';
import 'package:common/modelView/login/SocialLogin.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/widgets/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/frame/FrameView.dart';
import '../join/IdAndPasswordView.dart';

class YoungLoginView extends StatefulWidget {
  const YoungLoginView({Key? key}) : super(key: key);

  @override
  _YoungLoginView createState() => _YoungLoginView();
}

class _YoungLoginView extends State<YoungLoginView> {
  bool ischeck = false;
  TextEditingController _idController = TextEditingController();
  TextEditingController _passworController = TextEditingController();

  login(String email, String password) =>
      AwsServices().login(email, password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kTextBlackColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: 310.w,
              height: 70.h,
              margin: EdgeInsets.only(top: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("아이디",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),),
                  Container(
                    width: 300.w,
                    height: 40.h,
                    margin: EdgeInsets.only(top: 5.h),
                    decoration: BoxDecoration(
                        color: kBlankColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextFormField(
                      controller: _idController,
                      style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.center,
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.,
                          hintText: "",
                          border: InputBorder.none
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 310.w,
              height: 70.h,
              margin: EdgeInsets.only(top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("비밀번호",style: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold),),
                  Container(
                    width: 300.w,
                    height: 40.h,
                    margin: EdgeInsets.only(top: 5.h),
                    decoration: BoxDecoration(
                        color: kBlankColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextFormField(
                      controller: _passworController,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      cursorColor: kTextBlackColor,
                      obscureText: true,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.,
                          hintText: "",
                          border: InputBorder.none
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(),
              width: 160.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "자동로그인",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: kTextBlackColor),
                  ),
                  Checkbox(
                      focusColor: kPrimaryColor,
                      checkColor: kPrimaryColor,
                      fillColor:
                      MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.orange.withOpacity(.32);
                            }
                            return Colors.grey;
                          }),
                      value: ischeck,
                      onChanged: (value) {
                        setState(() {
                          ischeck = value!;
                        });
                      }),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                login(_idController.text, _passworController.text);
              //   Navigator.push(
              //       context,
              //       PageTransition(
              //           type: PageTransitionType.fade,
              //           child: (FrameView())));
              },
              child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: RoundedButtonWidget( title: '로그인',)),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        child: Text("아이디 찾기",style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        child: Text("비밀번호 찾기",style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: (IdAndPasswordView())));
                  },
                  child: Text(
                    "회원가입",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );

    //카카오 로그인 7:21
  }
}
