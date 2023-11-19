import 'package:common/model/account/AwsServices.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/widgets/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/find/FindIdView.dart';
import 'package:young/view/account/find/PasswordFindView.dart';
import '../../frame/YoungFrameView.dart';
import '../join/IdAndPasswordView.dart';
import '../join/VertifyPhoneView.dart';

class YoungLoginView extends StatefulWidget {
  const YoungLoginView({Key? key}) : super(key: key);

  @override
  _YoungLoginView createState() => _YoungLoginView();
}

class _YoungLoginView extends State<YoungLoginView> {
  bool ischeck = false;
  bool _obscurePassword = true; // 비밀번호 가리기 여부를 관리하는 변수

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
          width: 335.w,
          height: 60.h,
          margin: EdgeInsets.only(top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wBorderGrey300Color, width: 1),
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
                      hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
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
          width: 335.w,
          height: 60.h,
          margin: EdgeInsets.only(top: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 335.w,
                height: 46.h,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: wBorderGrey300Color, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16), // 힌트 텍스트와 입력란 간의 간격 조정
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextFormField(
                        controller: _passworController,
                        obscureText: _obscurePassword,
                        style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                        textAlign: TextAlign.left, // 텍스트를 왼쪽으로 정렬
                        cursorColor: kTextBlackColor,
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          hintStyle: TextStyle(color: wGrey300Color, fontSize: 14.sp),
                          border: InputBorder.none,
                          isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAutoLoginCheckBox() {
    return Container(
      margin: EdgeInsets.only(right: 165.w, bottom: 20.h),
      width: 185.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.black, // 테두리 색 (unchecked 상태의 색)
            ),
            child: Checkbox(
              focusColor: Colors.grey,
              checkColor: wTextBlackColor,
              activeColor: Colors.white, // 체크된 상태의 배경색
              value: ischeck,
              onChanged: (value) {
                setState(() {
                  ischeck = value!;
                });
              },
              side: BorderSide(color: ischeck ? Colors.black : Colors.black), // 테두리 색상 변경
            ),
          ),
          Text(
            "자동로그인",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: wTextBlackColor,
            ),
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
                  child: (YoungFrameView())));
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
        width: 190.w,
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
                child: Text("아이디 찾기",style: TextStyle(color: wGrey600Color,fontWeight: FontWeight.bold,fontSize: 16.sp),),
              ),
            ),
            Container(width: 1,height: 20.h, color: wGreyColor,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: (PasswordFindView())));
              },
              child: Container(
                child: Text("비밀번호 찾기",style: TextStyle(color: wGrey600Color,fontWeight: FontWeight.bold,fontSize: 16.sp),),
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
                    child: (VerifyPhoneView())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "회원가입 하러가기",
                style: TextStyle(
                    color: wPurpleColor, fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Container(
                child: Icon(Icons.navigate_next_outlined, color: wPurpleColor,),
              )
            ],
          )),
    );
  }
}
