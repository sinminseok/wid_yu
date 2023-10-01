import 'package:common/utils/Color.dart';
import 'package:common/utils/widgets/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/join/widgets/SignupAppBar.dart';

import 'JoinFinishView.dart';

class YoungCodeView extends StatefulWidget {
  const YoungCodeView({Key? key}) : super(key: key);

  @override
  _YoungCodeView createState() => _YoungCodeView();
}

class _YoungCodeView extends State<YoungCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(stepNumber: 3, canBack: false,),
      body: Container(
        margin: EdgeInsets.only(top: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25.w,bottom: 10.h),
                  child: Text(
                    "시니어 로그인용 사용코드.",
                    style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Container(
                    width: 320.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                    child: Center(child: Text("코드 번호",style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 25.w),
                  child: Text("xx시니어 님은 해당 코드로 로그인해주세요 ",style: TextStyle(color: kTextBlackColor),),
                ),
              ],
            ),
            Center(child: Container(
                margin: EdgeInsets.only(bottom: 30.h),
                child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: (JoinFinishView())));
                    },
                    child: RoundedButtonWidget(title: "시작하기",))))
          ],
        ),
      ),
    );
  }
}
