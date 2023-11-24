import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/account/join/widgets/ProgressBar.dart';
import 'package:wid_yu/young/account/join/widgets/SignupAppBar.dart';

import '../../../common/model/disease/Disease.dart';
import '../../../common/model/user/Old.dart';
import '../../../common/utils/Color.dart';
import '../../../common/utils/PopUp.dart';
import '../../../common/utils/exception/InvalidInformationException.dart';
import '../../../common/utils/widgets/TextFormWidget.dart';
import '../popup/AcoountPopup.dart';

class OldInformationView extends StatefulWidget {
  const OldInformationView({Key? key}) : super(key: key);

  @override
  _OldInformationView createState() => _OldInformationView();
}

class _OldInformationView extends State<OldInformationView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController _diseaseNameController = TextEditingController();
  TextEditingController _drugNameController = TextEditingController();
  TextEditingController _drugInformationController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  TextEditingController _introduceController = TextEditingController();

  bool canAddDisease = true;
  bool canNextStep = false;
  bool? isDisease;

  List<Disease> diseases = [];

  final String INPUT_VALUE_EMPTY_ERROR = "모든 값들을 입력해주세요.";

  void resetController() {
    _diseaseNameController.clear();
    _drugNameController.clear();
    _introduceController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.clear();
    _ageController.clear();
    _phoneNumberController.clear();
    _addressController.clear();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 각 컨트롤러의 변화를 감지하여 상태를 업데이트합니다.
    _nameController.addListener(updateNextStepState);
    _ageController.addListener(updateNextStepState);
    _phoneNumberController.addListener(updateNextStepState);
    _addressController.addListener(updateNextStepState);
  }

  void updateNextStepState() {
    // 각 컨트롤러의 입력값이 비어있지 않으면 true로 설정합니다.
    bool isAllFilled = _nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _addressController.text.isNotEmpty;

    // 이전 상태와 현재 상태가 다르면 setState를 호출하여 UI를 업데이트합니다.
    if (canNextStep != isAllFilled) {
      setState(() {
        canNextStep = isAllFilled;
      });
    }
  }

  Old createSenior(String name, int age, int phoneNumber, String address) {
    return Old(name, age, phoneNumber, address, false);
  }

  void removeDisease(int index) {
    setState(() {
      diseases.removeAt(index);
    });
  }

  void checkDiseaseAnswer() {
    if (_diseaseNameController.text.isEmpty) {
      throw InvalidInformationException("질병이름은 필수로 입력해주세요.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SignUpAppBar(
        canBack: false,
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(2),
                _buildMainText(),
                _buildOldInformationTextFied(),
                _buildAskHaveDisease(),
                _buildDiseaseInformationTextField(),
                Center(child: _buildButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 10.h, left: 15.w),
      child: Text(
        "부모님의 정보를 대신 입력해 주세요.",
        style: TextStyle(
            color: wGrey800Color, fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOldInformationTextFied() {
    return Center(
      child: Column(
        children: [
          TextFormWidget(
            textEditingController: _nameController,
            hintText: "예) 홍길동",
            title: '이름',
            isIntType: false,
          ),
          TextFormWidget(
            textEditingController: _ageController,
            title: '출생년도',
            hintText: "주민등록번호 앞6자리 예)720923",
            isIntType: true,
          ),
          TextFormWidget(
              textEditingController: _phoneNumberController,
              title: '연락처',
              hintText: "010 1234 5678",
              isIntType: true),
          TextFormWidget(
              textEditingController: _addressController,
              title: '집주소',
              hintText: "도로명 주소",
              isIntType: false),
        ],
      ),
    );
  }

  Widget _buildAskHaveDisease() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 360.w,
      height: 132.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 20.w),
            child: Text(
              "부모님께서 보유한 질병이 있나요?",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 17.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0.w, top: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isDisease = true;
                    });
                  },
                  child: Container(
                    width: 157.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isDisease == null
                              ? wGrey200Color
                              : isDisease == true
                                  ? wPurple200Color
                                  : wGrey200Color),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: isDisease == true
                          ? wPurpleColor
                          : Colors.grey.shade200,
                    ),
                    child: Center(
                        child: Text(
                      "있음",
                      style: TextStyle(
                          color: isDisease == true
                              ? wWhiteColor
                              : Colors.grey.shade600),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isDisease = false;
                    });
                  },
                  child: Container(
                    width: 157.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isDisease == false
                              ? wPurple200Color
                              : wGrey200Color),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: isDisease == false
                          ? wPurpleColor
                          : Colors.grey.shade200,
                    ),
                    child: Center(
                        child: Text(
                      "없음",
                      style: TextStyle(
                          color: isDisease == false
                              ? wWhiteColor
                              : Colors.grey.shade600),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSaveDiseaseInformation() {
    return Column(
      children: diseases.asMap().entries.map((entry) {
        final index = entry.key;
        final disease = entry.value;
        return Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '질병 #${index + 1}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kTextBlackColor),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red), // 삭제 아이콘
                        onPressed: () {
                          // 삭제 버튼을 눌렀을 때 처리할 로직을 여기에 추가
                          removeDisease(index); // 해당 객체를 삭제하는 함수 호출
                        },
                      ),
                    ],
                  ),
                  children: [
                    ListTile(
                      title: Text('질병 이름: ${disease.diseaseName}',
                          style: TextStyle(color: kTextBlackColor)),
                    ),
                    if (disease.drug!.isNotEmpty)
                      ListTile(
                        title: Text('복용 중인 약: ${disease.drug}',
                            style: TextStyle(color: kTextBlackColor)),
                      ),
                    if (disease.introduce!.isNotEmpty)
                      ListTile(
                        title: Text('설명: ${disease.introduce}',
                            style: TextStyle(color: kTextBlackColor)),
                      ),
                  ],
                ),
              ],
            ));
      }).toList(),
    );
  }

  Widget _buildDiseaseInformationTextField() {
    return isDisease == true
        ? Center(
            child: Container(
              margin: EdgeInsets.only(top: 0.h),
              width: 340.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 0.h),
                      child: TextFormWidget(
                        textEditingController: _diseaseNameController,
                        title: '질병이름(필수)',
                        isIntType: false,
                        hintText: '12',
                      )),
                  TextFormWidget(
                    textEditingController: _drugNameController,
                    title: '복용중인 약(선택)',
                    isIntType: false,
                    hintText: '12',
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
                          width: 335.w,
                          height: 140.h,
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: wGrey300Color),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 5.h, left: 10.w),
                            child: TextFormField(
                              controller: _drugInformationController,
                              style: TextStyle(color: Colors.black),
                              // 텍스트 색상을 검정색으로 설정
                              textAlign: TextAlign.left,
                              // 텍스트를 왼쪽으로 정렬
                              cursorColor: kTextBlackColor,
                              decoration: InputDecoration(
                                hintText:
                                    "질병에 관련된 자세한 설명이나\n응급상황시 구조자가 알아야 하는 설명을 적어주세요.",
                                hintStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.grey.shade500),
                                border: InputBorder.none,
                                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                              ),
                              maxLines: null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     try{
                  //       checkDiseaseAnswer();
                  //       var disease = Disease(_diseaseNameController.text,
                  //           _drugNameController.text, _introduceController.text);
                  //       diseases.add(disease);
                  //       setState(() {
                  //         canAddDisease = !canAddDisease;
                  //         resetController();
                  //       });
                  //     }catch (e) {
                  //       if (e is InvalidInformationException) {
                  //         ToastMessage().showtoast(e.cause);
                  //       }
                  //     }
                  //
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 20.h, bottom: 30.h,right: 0.w),
                  //
                  //     child: Center(
                  //       child: Text(
                  //         "질병 추가 +",
                  //         style: TextStyle(color: kTextBlackColor),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )
        : Container();
  }

  Widget _buildButton() {
    return canNextStep
        ? InkWell(
            onTap: () {
              var old = createSenior(
                  _nameController.text,
                  int.parse(_ageController.text),
                  int.parse(_phoneNumberController.text),
                  _addressController.text);
              AccountPopup().showDialog(context, old);
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         type: PageTransitionType.fade,
              //         child: (OtherOldInformationView(senior)  )));

              // Navigator.push(
              //     context,
              //     PageTransition(
              //         type: PageTransitionType.fade,
              //         child: (JoinSuccessView())));
            },
            child: Container(
              width: 335.w,
              height: 50.h,
              margin: EdgeInsets.only(top: 60.h, bottom: 20.h),
              decoration: BoxDecoration(
                  color: wOrangeColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text("다음"),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              ToastMessage().showtoast("모든 문항을 입력해주세요.");
            },
            child: Container(
              width: 335.w,
              height: 50.h,
              margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
              decoration: BoxDecoration(
                  color: Color(0xffD5DDE4),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text("다음"),
              ),
            ),
          );
  }
}
