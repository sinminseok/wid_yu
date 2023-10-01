import 'package:common/model/disease/Disease.dart';
import 'package:common/model/user/Old.dart';
import 'package:common/utils/Color.dart';
import 'package:common/utils/widgets/RoundedButton.dart';
import 'package:common/utils/widgets/TextFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:young/view/account/join/widgets/DiseaseWidget.dart';
import 'package:young/view/account/join/widgets/SignupAppBar.dart';

import 'YoungCodeView.dart';


class DiseaseView extends StatefulWidget {


  @override
  State<DiseaseView> createState() => _DiseaseView();
}

class _DiseaseView extends State<DiseaseView> {

  TextEditingController _diseaseNameController = TextEditingController();
  TextEditingController _drugNameController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();

  bool canAddDisease = true;
  List<Disease> diseases = [];

  void resetController(){
    _diseaseNameController.clear();
    _drugNameController.clear();
    _introduceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(stepNumber: 2, canBack: false,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //DiseaseWidget 추가 위치
            Column(
              children: diseases.map((disease) {
                return DiseaseWidget(disease: disease);
              }).toList(),
            ),
            !canAddDisease?Container():Container(
                    width: 360.w,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: TextFormWidget(
                              textEditingController: _diseaseNameController,
                              title: '질병이름(필수)',
                              isIntType: false,
                            )),
                        TextFormWidget(
                          textEditingController: _drugNameController,
                          title: '복용중인 약(선택)',
                          isIntType: false,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "설명(선택)",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Container(
                                width: 300.w,
                                height: 160.h,
                                decoration: BoxDecoration(
                                    color: kBlankColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  // 텍스트 색상을 검정색으로 설정
                                  textAlign: TextAlign.center,
                                  cursorColor: kTextBlackColor,
                                  obscureText: true,
                                  controller: _introduceController,

                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(right: 200.w),
                                      hintText: "설명.",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {

                            var disease = Disease(
                                _diseaseNameController.text,
                                _drugNameController.text,
                                _introduceController.text);
                            diseases.add(disease);
                            setState(() {
                              canAddDisease = !canAddDisease;
                              resetController();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20.h),
                            width: 300.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                                color: kButtonColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "질병 등록",
                                style: TextStyle(color: kTextWhiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
            canAddDisease?Container():InkWell(
              onTap: (){
                setState(() {
                  canAddDisease = !canAddDisease;
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.h,right: 260.w),
                child: Text("+ 질병 추가",style: TextStyle(color: kTextBlackColor, fontSize: 18.sp),),
              ),
            ),
            diseases.length == 0
                ? Container()
                : Container(margin: EdgeInsets.only(top: 20.h),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: (YoungCodeView())));
                    },
                    child: RoundedButtonWidget(
                        title: '다음',
                      ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
