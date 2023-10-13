import 'package:common/model/account/AwsServices.dart';
import 'package:common/modelView/login/KakaoLogin.dart';
import 'package:common/modelView/login/SocialLogin.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/widgets/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/find/FindIdView.dart';
import 'package:young/view/account/find/IdFindView.dart';
import 'package:young/view/account/find/PasswordFindView.dart';
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
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMainText(),
            _buildUserInformationTextField(),
            _buildAutoLoginCheckBox(),
            _buildLoginButton(),
            _buildSearchInformation(),
            _buildSignUpText()
          ],
        ),
      ),
    );

    //카카오 로그인 7:21
  }

  Widget _buildMainText() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Text("보호자 계정으로 로그인해요", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: kTextBlackColor),),
          ),

          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Text("부모님 계정 생성은 보호자 계정에서 가능해요.", style: TextStyle( fontSize: 14.sp, color: kTextGreyColor),),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInformationTextField() {
    return Column(
      children: [
        Container(
          width: 310.w,
          height: 70.h,
          margin: EdgeInsets.only(top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: kTextGreyColor, width: 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16), // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    controller: _idController,
                    style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "아이디",
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
        Container(
          width: 310.w,
          height: 60.h,
          margin: EdgeInsets.only(top: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: kTextGreyColor, width: 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16), // 힌트 텍스트와 입력란 간의 간격 조정
                  child: TextFormField(
                    controller: _passworController,
                    obscureText: true,
                    style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "비밀번호",
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAutoLoginCheckBox(){
    return Container(
      margin: EdgeInsets.only(right: 165.w,bottom: 20.h),
      width: 160.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              focusColor: Colors.white,
              checkColor: Colors.grey,
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
          Text(
            "자동로그인",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: kTextGreyColor),
          ),

        ],
      ),
    );
  }

  Widget _buildLoginButton(){
    return InkWell(
      onTap: (){

         //login(_idController.text, _passworController.text);

          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: (FrameView())));
      },
      child: Container(
          margin: EdgeInsets.only(top: 0.h),
          child: RoundedButtonWidget( title: '로그인',)),
    );
  }

  Widget _buildSearchInformation(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 170.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: (FindIdView())));
              },
              child: Container(
                child: Text("아이디 찾기",style: TextStyle(color: kTextGreyColor,fontWeight: FontWeight.bold,fontSize: 13.sp),),
              ),
            ),
            Container(width: 1,height: 20.h, color: kTextGreyColor,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: (PasswordFindView())));
              },
              child: Container(
                child: Text("비밀번호 찾기",style: TextStyle(color: kTextGreyColor,fontWeight: FontWeight.bold,fontSize: 13.sp),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpText(){
    return Container(
      margin: EdgeInsets.only(top: 100.h),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: (IdAndPasswordView())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "회원가입 하러가기",
                style: TextStyle(
                    color: kPurpleColor, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Icon(Icons.navigate_next_outlined, color: kPurpleColor,),
              )
            ],
          )),
    );
  }
}
