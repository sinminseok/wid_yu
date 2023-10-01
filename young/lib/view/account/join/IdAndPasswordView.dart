import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/join/widgets/SignupAppBar.dart';

import 'JoinFinishView.dart';
import 'OldInformationView.dart';

class IdAndPasswordView extends StatefulWidget {
  const IdAndPasswordView({Key? key}) : super(key: key);

  @override
  _IdAndPasswordView createState() => _IdAndPasswordView();
}

class _IdAndPasswordView extends State<IdAndPasswordView> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(stepNumber: 1, canBack: true,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30.w,bottom: 10.h),
                child: const Text(
                  "사용하실 아이디와 비밀번호를 입력해주세요.",
                  style: TextStyle(color: kTextBlackColor),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.w,top: 10.h),
                    child: const Text("아이디",style: TextStyle(color: kTextBlackColor),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 240.w,
                        height: 40.h,
                        margin: EdgeInsets.only(top: 5.h),
                        decoration: BoxDecoration(
                            color: kBlankColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          // 텍스트 색상을 검정색으로 설정
                          textAlign: TextAlign.center,
                          cursorColor: kTextBlackColor,
                          obscureText: true,

                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.,
                              hintText: "",
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: 60.w,
                        height: 40.h,
                        margin: EdgeInsets.only(top: 5.h),
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.only(
                              topRight: Radius.circular(10.0), // 오른쪽 위 모서리 둥글기 설정
                              bottomRight: Radius.circular(10.0), // 오른쪽 아래 모서리 둥글기 설정
                            ),
                            color: kButtonColor),
                        child: Center(
                            child: Text(
                              "중복확인",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w,top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("비밀번호",style: TextStyle(color: Colors.black),),
                    ),
                    Container(
                      width: 300.w,
                      height: 40.h,
                      margin: EdgeInsets.only(top: 5.h),
                      decoration: BoxDecoration(
                          color: kBlankColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        // 텍스트 색상을 검정색으로 설정
                        textAlign: TextAlign.center,
                        cursorColor: kTextBlackColor,
                        obscureText: true,

                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.,
                            hintText: "",
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 280.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: (OldInformationView())));
                      },
                      child: Container(
                        width: 158.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Text("바로 계정생성"),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: (JoinFinishView())));
                      },
                      child: Container(
                        width: 158.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Text("바로 계정생성"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
